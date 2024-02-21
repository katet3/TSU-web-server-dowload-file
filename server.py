from flask import Flask, send_from_directory

app = Flask(__name__)

# Задайте директорию, из которой можно будет скачивать файлы
UPLOAD_FOLDER = '/home/user/ftp-server/ftp-files'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/download/<filename>', methods=['GET'])
def download_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'], filename)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=6000)
