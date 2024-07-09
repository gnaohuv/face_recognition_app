import json
from django.shortcuts import render,redirect
from django.http import HttpResponse,JsonResponse
from .models import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
import base64 
from .utils import is_ajax, classify_face
from django.core.files.base import ContentFile
from django.contrib.auth.models import User
from logs.models import Log
from profiles.models import Profile
from functools import wraps
# Create your views here.
def detail(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created =  Order.objects.get_or_create(customer = customer,complete =False)
        items = order.orderitem_set.all()
        cartitems = order.get_cart_items
        user_not_login = "hidden"
        user_login = "show"
    else:
        items =[]
        order = {'get_cart_items':0, 'get_cart_tatol':0}
        cartitems = order['get_cart_items']
        user_not_login = "show"
        user_login = "hidden"
    id = request.GET.get('id', '')
    products = Product.objects.filter(id=id)
    categories = Category.objects.filter(is_sub =False)
    context= {'products': products,'items': items, 'order': order, 'categories': categories,
              'cartitems': cartitems, 'user_not_login': user_not_login, 'user_login': user_login}
    return render(request, 'app/detail.html',context)


def category(request):
    categories = Category.objects.filter(is_sub =False)
    active_category = request.GET.get('category','')
    if active_category:
        products = Product.objects.filter(category__slug = active_category)
        if request.user.is_authenticated:
            customer = request.user
            order, created =  Order.objects.get_or_create(customer = customer,complete =False)
            items = order.orderitem_set.all()
            cartitems = order.get_cart_items
            user_not_login = "hidden"
            user_login = "show"
        else:
            items =[]
            order = {'get_cart_items':0, 'get_cart_tatol':0}
            cartitems = order['get_cart_items']
            user_not_login = "show"
            user_login = "hidden" 
    context = {'user_not_login': user_not_login, 'user_login': user_login, 'cartitems': cartitems,
               'categories': categories, 'products': products, 'active_category': active_category}
    return render(request,'app/category.html',context)


def search(request):
    if  request.method == "POST":
        searched = request.POST["searched"]
        keys = Product.objects.filter(name__contains = searched)
    if request.user.is_authenticated:
        customer = request.user
        order, created =  Order.objects.get_or_create(customer = customer,complete =False)
        items = order.orderitem_set.all()
        cartitems = order.get_cart_items
        user_not_login = "hidden"
        user_login = "show"
    else:
        items =[]
        order = {'get_cart_items':0, 'get_cart_tatol':0}
        cartitems = order['get_cart_items']
        user_not_login = "show"
        user_login = "hidden"
    categories = Category.objects.filter(is_sub =False)
    products = Product.objects.all()
    context = {'searched': searched, 'keys': keys, 'products': products, 'categories': categories,
                'cartitems': cartitems,'user_not_login': user_not_login, 'user_login': user_login}
    return render(request,'app/search.html',context)

def register(request):
    form = CreateUserForm()
    if request.method == "POST":
        form = CreateUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            new_profiles = Profile.objects.create(user=user)
            # Đăng nhập người dùng ngay sau khi đăng ký thành công (tuỳ chọn)
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            # Lưu thông tin người dùng vào session
            request.session['user_id'] = user.id
            categories = Category.objects.filter(is_sub=False)
            user_not_login = "hidden"
            user_login = "show"
            context = {'user': username,'categories': categories, 'user_login':user_login, 'user_not_login':user_not_login }
            return render(request,'app/register2.html',context)
        else:
            for field, errors in form.errors.items():
                for error in errors:
                    messages.error(request, f"Lỗi ở trường '{form.fields[field].label}': {error}")
    categories = Category.objects.filter(is_sub=False)
    user_not_login = "hidden"
    user_login = "hidden"
    context = {'form': form, 'categories': categories, 'user_login':user_login, 'user_not_login':user_not_login }
    return render(request, 'app/register.html', context)


def save_profiles(request):
    if is_ajax(request):
        photo = request.POST.get('photo')
        _, str_img = photo.split(';base64')
        
        decoded_file = base64.b64decode(str_img)
        
        user = request.session['user_id']
        print(user)
        user = User.objects.get(id = user)
        
        x = Profile.objects.get(user=user)
        x.photo.save('upload.png', ContentFile(decoded_file))
        x.save()
    
        return redirect('home')
    
def loginPage(request):
    if request.user.is_authenticated:
        return redirect('home')
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request,username =username,password =password)
        if user is not None :
            user_profile = Profile.objects.get(user = user)
            photo_path = user_profile.photo.path
            with open(photo_path,'rb') as f:
                image_content = f.read()
            
            photo = base64.b64encode(image_content).decode('utf-8')
            request.session['user_profile'] = {
                'username':username,
                'photo': photo,
            }
            # return render(request,'app/login2.html',context)
            return redirect('login2')
        else: 
            messages.info(request, 'Tài khoản hoặc mật khẩu không chính xác!')
            
    user_not_login = "hidden"
    user_login = "hidden"
    categories = Category.objects.filter(is_sub =False)
    context = {'user_not_login': user_not_login, 'user_login': user_login, 'categories': categories}
    return render(request,'app/login.html',context)

def login2(request):
    user_not_login = "hidden"
    user_login = "hidden"
    categories = Category.objects.filter(is_sub =False)
    context = {'user_not_login': user_not_login, 'user_login': user_login, 'categories': categories}
    return render(request,'app/login2.html',context)

def find_user_view(request):
    user_profile = request.session.get('user_profile')
    username = user_profile['username']
    user = User.objects.get(username = username)
    user_photo = user_profile['photo']
    if is_ajax(request):
        photo = request.POST.get('photo')
        _, str_img = photo.split(';base64')

        # Giaỉ mã ảnh được mã hóa base 64
        decoded_file = base64.b64decode(str_img)
        
        # Ghi lại Log xác thực khuôn mặt
        x = Log()
        x.photo.save('upload.png', ContentFile(decoded_file))
        x.save()
        path_to_img_save_in_log = x.photo.path
        res = classify_face(path_to_img_save_in_log,username)
        if res[0] == True:
            # Code xử lí sau khi xác thực khuôn mặt thành công
            login(request, user)
            return JsonResponse({'success': True})
        else : 
            return JsonResponse({'success': False})
    if request.user.is_authenticated:
        return redirect('home')
    user_not_login = "hidden"
    user_login = "hidden"
    categories = Category.objects.filter(is_sub =False)
    context = {'user_not_login': user_not_login, 'user_login': user_login, 'categories': categories}
    return render(request,'app/login2.html',context)


def logoutPage(request):
    logout(request)
    return redirect('home')


def home(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created =  Order.objects.get_or_create(customer = customer,complete =False)
        items = order.orderitem_set.all()
        cartitems = order.get_cart_items
        user_not_login = "hidden"
        user_login = "show"
    else:
        items =[]
        order = {'get_cart_items':0, 'get_cart_tatol':0}
        cartitems = order['get_cart_items']
        user_not_login = "show"
        user_login = "hidden"
    categories = Category.objects.filter(is_sub =False)
    products = Product.objects.all()
    context= {'products': products, 'cartitems': cartitems, 'user_not_login': user_not_login,
              'user_login': user_login,'categories': categories}
    return render(request, 'app/home.html',context)
def cart(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created =  Order.objects.get_or_create(customer = customer,complete =False)
        items = order.orderitem_set.all()
        cartitems = order.get_cart_items
        user_not_login = "hidden"
        user_login = "show"
    else:
        items =[]
        order = {'get_cart_items':0, 'get_cart_tatol':0}
        cartitems = order['get_cart_items']
        user_not_login = "show"
        user_login = "hidden"
    categories = Category.objects.filter(is_sub =False)
    context= {'categories':categories,'items': items, 'order': order, 'cartitems': cartitems, 
              'user_not_login': user_not_login, 'user_login': user_login}
    return render(request, 'app/cart.html',context)
def checkout(request):
    if request.user.is_authenticated:
        customer = request.user
        order, created =  Order.objects.get_or_create(customer = customer,complete =False)
        items = order.orderitem_set.all()
        cartitems = order.get_cart_items
        user_not_login = "hidden"
        user_login = "show"
    else:
        items =[]
        order = {'get_cart_items':0, 'get_cart_tatol':0}
        cartitems = order['get_cart_items']
        user_not_login = "show"
        user_login = "hidden"
    categories = Category.objects.filter(is_sub =False)
    context= {'items': items, 'order': order, 'cartitems': cartitems, 'categories': categories, 
              'user_not_login': user_not_login, 'user_login': user_login}
    return render(request, 'app/checkout.html',context)
def updateItem(request):
    data = json.loads(request.body)
    productId = data['productId']
    action = data['action']
    customer = request.user
    product = Product.objects.get(id = productId)
    order, created =  Order.objects.get_or_create(customer = customer,complete =False)
    orderItem, created =  OrderItem.objects.get_or_create(order = order,product =product)
    if action == 'add':
        orderItem.quantity +=1
    elif action == 'remove':
        orderItem.quantity -=1
    orderItem.save()
    if orderItem.quantity<=0:
        orderItem.delete()
    
    return JsonResponse('added', safe=False)