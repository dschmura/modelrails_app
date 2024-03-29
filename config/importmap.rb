# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "hotkeys-js", to: "https://ga.jspm.io/npm:hotkeys-js@3.12.0/dist/hotkeys.esm.js"
# https://github.com/stimulus-components
pin "stimulus-dropdown", to: "https://ga.jspm.io/npm:stimulus-dropdown@2.1.0/dist/stimulus-dropdown.mjs"
pin "stimulus-use", to: "https://ga.jspm.io/npm:stimulus-use@0.51.3/dist/index.js"
pin "stimulus-notification", to: "https://ga.jspm.io/npm:stimulus-notification@2.2.0/dist/stimulus-notification.mjs"
