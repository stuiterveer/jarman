import os

APP_ID = os.environ.get("APP_ID", "").split('_')[0]
CONFIGBASE = os.environ.get("XDG_CONFIG_HOME", "/tmp") + "/" + APP_ID
CACHEBASE = os.environ.get("XDG_CACHE_HOME", "/tmp") + "/" + APP_ID

def runJar(width, height, scaling):
    fileContents = str(width) + " " + str(height) + " " + str(scaling)
    with open(CONFIGBASE + '/runJar', 'w+') as f:
        f.write(fileContents)