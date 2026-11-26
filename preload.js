const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('wdDesktop', {
  openPath: (targetPath) => ipcRenderer.invoke('open-path', targetPath)
});
