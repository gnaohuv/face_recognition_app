console.log('hello world')



// $(document).ready(function ()
// {
//     $('#reload-btn').click(function(){
//     window.location.reload()


// })
// }
// )
document.addEventListener("DOMContentLoaded", function() {
    const video = document.getElementById('video-element')
    const image = document.getElementById('img-element')
    const captureBtn = document.getElementById('capture-btn')
    const reloadBtn = document.getElementById('reload-btn')
    reloadBtn.addEventListener('click', () => {
        window.location.reload();
    });

    if (navigator.mediaDevices.getUserMedia) {
        navigator.mediaDevices.getUserMedia({video: true})
        .then((stream) => {
            video.srcObject = stream
            const {height, width} = stream.getTracks()[0].getSettings()
    
            captureBtn.addEventListener('click', e=> {
                e.preventDefault()
                captureBtn.classList.add('not-visible')
                const track = stream.getVideoTracks()[0]
                const imageCapture = new ImageCapture(track)
                console.log(imageCapture)
    
                imageCapture.takePhoto().then(blob => {
                    console.log("took photo:", blob)
                    const img = new Image(width, height)
                    img.src = URL.createObjectURL(blob)
                    image.append(img)
    
                    video.classList.add('not-visible')
    
                    const reader = new FileReader()
    
                    reader.readAsDataURL(blob)
                    reader.onloadend = () => {
                        const base64data = reader.result
                        console.log(base64data)
    
                        const fd = new FormData()
                        fd.append('csrfmiddlewaretoken', csrftoken)
                        fd.append('photo', base64data)
    
                        $.ajax({
                            type: 'POST',
                            url: '/classify/',
                            enctype: 'multipart/form-data',
                            data: fd,
                            processData: false,
                            contentType: false,
                            success: (resp) => {
                                console.log(resp)
                                window.location.href = window.location.origin
                            },
                            error: (err) => {
                                console.log(err)
                            }
                        })
                    }
                }).catch(error => {
                    console.log('takePhoto() error: ', error);
                });
            });
        })
        .catch(error => {
            console.log("Something went wrong!", error);
        });
    }
});
