import face_recognition as fr
import numpy as np
from profiles.models import Profile
from django.contrib.auth.models import User


def is_ajax(request):
    return request.headers.get("x-requested-with") == "XMLHttpRequest"


def get_encoded_faces(username):
    """
    This function loads a user
    profile images and encodes the face

    """

    user = User.objects.get(username=username)
    qs = Profile.objects.get(user=user)

    photo = qs.photo.path
    print(photo)
    encoding = None

    face = fr.load_image_file(photo)

    face_encodings = fr.face_encodings(face)[0]
    return face_encodings


def classify_face(img, username):
    """
    Nhận vào Username và một ảnh đầu vào được sử dụng để so với ảnh trong csdl --> True/False
    """
    # Lấy ảnh khuôn mặt thông qua username
    faces = get_encoded_faces(username)
    print(img)
    # Đưa input khuôn mặt vào
    img = fr.load_image_file(img)

    try:
        # Find the locations of all faces in the input image
        face_locations = fr.face_locations(img)

        # Encode the faces in the input image
        unknown_face_encodings = fr.face_encodings(img, face_locations)[0]
        matches = fr.compare_faces([faces], unknown_face_encodings)
        return matches
    except:
        return False
