const { contextBridge, ipcRenderer, webUtils } = require('electron');

contextBridge.exposeInMainWorld('wdDesktop', {
  openPath: (targetPath) => ipcRenderer.invoke('open-path', targetPath),
  getPathForFile: (file) => {
    try {
      return webUtils.getPathForFile(file) || file.path || '';
    } catch {
      return file.path || '';
    }
  }
});
