document.addEventListener('DOMContentLoaded', function() {
    const albums = [
        {
            id: 'album1',
            images: [
                'Foto1.jpg',
                'Foto2.jpg',
                'Foto3.jpg',
                'Foto4.jpg',
                'Foto5.jpg',
                'Foto6.jpg',
                'Foto7.jpg',
                'Foto8.jpg',
                'Foto9.jpg',
                'Foto10.jpg',
                'Foto11.jpg',
                'Foto12.jpg',
                'Foto13.jpg',
                'Foto14.jpg',
                'Foto15.jpg'
            ]
        },
        {
            id: 'album2',
            images: [
                '1.jpg',
                '2.jpg',
                '3.jpg',
                '4.jpg',
                '5.jpg',
                '6.jpg',
                '7.jpg',
                '8.jpg',
                '9.jpg',
                '10.jpg',
                '11.jpg',
                '12.jpg',
                '13.jpg',
                '14.jpg',
                '15.jpg',
                '16.jpg',
                '17.jpg',
                '18.jpg',
                '19.jpg',
                '20.jpg',
                '21.jpg',
                '22.jpg',
                '23.jpg',
            ]
        }
    ];

    albums.forEach(album => {
        let currentIndex = 0;
        const albumElement = document.getElementById(album.id);
        const imgElement = albumElement.querySelector('.displayedImage');

        function showImage(index) {
            imgElement.src = album.images[index];
        }

        showImage(currentIndex);

        albumElement.addEventListener('click', function(event) {
            const width = imgElement.offsetWidth;
            const clickX = event.clientX - imgElement.getBoundingClientRect().left;

            if (clickX < width / 2) {
                // Click en la mitad izquierda de la imagen
                currentIndex = (currentIndex - 1 + album.images.length) % album.images.length;
            } else {
                // Click en la mitad derecha de la imagen
                currentIndex = (currentIndex + 1) % album.images.length;
            }

            showImage(currentIndex);
        });
    });
});