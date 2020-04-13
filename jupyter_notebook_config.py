c = get_config()
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8888
c.NotebookApp.notebook_dir = '/opt/python/work/'
c.LabApp.user_settings_dir = '/opt/python/jupyterlab/lab/user-settings'
c.LabApp.workspaces_dir = '/opt/python/jupyterlab/lab/work'
c.NotebookApp.password = u'sha1:c4f14a0d61e2:68c5177c43406f388daca4ae4ff8359290b97e2e'
