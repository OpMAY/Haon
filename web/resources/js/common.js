'use strict';
$(document).ready(function() {
  console.log('common.js execute');
  $(document.body).on('click', '#download-qr', function () {
    let qr = document.getElementById('trace-qr')
    let qrCanvas = qr.querySelector('canvas');
    let a = qr.querySelector('a');
    a.download = 'HAON_QR_' + tokenGenerator() + '.png';
    a.href = qrCanvas.toDataURL('image/png').replace("image/png", "image/octet-stream");
    a.click();
  })
});
