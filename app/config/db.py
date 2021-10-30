from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

SQLITE = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}

MySQL = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'disafra',
            'USER': 'admin',
            'PASSWORD': 'admin123',
            'HOST': 'localhost',
            'PORT': '3306',
        }
    }