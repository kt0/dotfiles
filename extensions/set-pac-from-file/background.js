'use strict';


function logFailure(message) {
  alert(message)
}

async function fetchText(url) {
  let response = await fetch(url);
  return response.text();
}


function setChromeProxySettings(pacText) {
  chrome.proxy.settings.set(
    {
      value: {
        mode: 'pac_script',
        pacScript: {
          data: pacText,
          mandatory: true,
        },
      },
    },
    function() {
      const err = chrome.runtime.lastError;
      if(err)
        logFailure("chrome.proxy.settings.set() failed: " + err);
    }
  );
}

async function init() {
  let url = chrome.runtime.getURL("my_pac_script.js")

  let pacText;
  try {
    pacText = await fetchText(url);
  } catch (e) {
    logFailure("Failed fetching " + JSON.stringify(url));
    return;
  }

  setChromeProxySettings(pacText);
}

init();
