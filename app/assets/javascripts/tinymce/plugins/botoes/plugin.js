tinyMCE.PluginManager.add('botoes', function(editor, url) {
  
   editor.addButton("novo-btn", {
        tooltip: "Botão customizado",
        text: "Botão Novo",
        onClick: function () {
            x = editor.selection.getContent();
            editor.insertContent('&nbsp;<b>Texto inserido pelo botão!</b>&nbsp;'+x);
            teste(x);
        
      },
         onPostRender: function() {
             var self = this, setup = function() {
                 editor.formatter.formatChanged("novo-btn", function(state) {
                     self.active(state);
                 });
             };
             editor.formatter ? setup() : editor.on('init', setup);
         }
     })

   editor.addButton("latex", {
        tooltip: "Latex puro",
        text: "Latex",
        onClick: function () {
          editor.focus();
          editor.selection.setContent('<latex>/latex{' + editor.selection.getContent() + '}</latex>');
      },
         onPostRender: function() {
             var self = this, setup = function() {
                 editor.formatter.formatChanged("latex", function(state) {
                     self.active(state);
                 });
             };
             editor.formatter ? setup() : editor.on('init', setup);
         }
     })
    /*
     editor.addButton('lista', {
        type: 'listbox',
        text: 'Capítulos',
        icon: false,
        onselect: function (e) {
            x = editor.selection.getContent();
            teste(x);
          editor.insertContent(this.value());
        },
        values: [
          { text: 'Capítulo 1', value: 'teste' },
          { text: 'Capítulo 1.1', value: '&nbsp;<em>Some italic text!</em>' },
          { text: 'Capítulo 1.1.1', value: '&nbsp;Some plain text ...' },
          { text: 'Capítulo 1.1.1.1', value: '&nbsp;Some plain text ...' }
        ],
        onPostRender: function () {
          // Select the second item by default
          this.value('&nbsp;<em>Listagem</em>');
        }
      });
      */
      editor.addButton('lista', {
        text: 'My menu item',
        
        onclick: function() {
          editor.insertContent('&nbsp;Here\'s some content!&nbsp;');
          
        },
        
        onPostRender: function() {
            var self = this, setup = function() {
                editor.formatter.formatChanged("lista", function(state) {
                    self.active(state);
                });
            };
            editor.formatter ? setup() : editor.on('init', setup);
        }
      })
      
      //formatadores de capítulos:
      editor.addButton("cap1", {
        tooltip: "Título",
        text: "Cap 1",
        onClick: function () {
            editor.focus();
            x = editor.selection.getContent();
            editor.selection.setContent('<h1>' + editor.selection.getContent() + '</h1>');
            teste(x);
        
      },
         onPostRender: function() {
             var self = this, setup = function() {
                 editor.formatter.formatChanged("cap1", function(state) {
                     self.active(state);
                 });
             };
             editor.formatter ? setup() : editor.on('init', setup);
         }
     })

     editor.addButton("cap2", {
        tooltip: "Sub título",
        text: "Cap 1.1",
        onClick: function () {
            editor.focus();
            x = editor.selection.getContent();
            editor.selection.setContent('<h2>' + editor.selection.getContent() + '</h2>');
            teste(x);
        
      },
         onPostRender: function() {
             var self = this, setup = function() {
                 editor.formatter.formatChanged("cap2", function(state) {
                     self.active(state);
                 });
             };
             editor.formatter ? setup() : editor.on('init', setup);
         }
     })

     editor.addButton("cap3", {
        tooltip: "Sub sub título",
        text: "Cap 1.1.1",
        onClick: function () {
            editor.focus();
            x = editor.selection.getContent();
            editor.selection.setContent('<h3>' + editor.selection.getContent() + '</h3>');
            teste(x);
        
      },
         onPostRender: function() {
             var self = this, setup = function() {
                 editor.formatter.formatChanged("cap3", function(state) {
                     self.active(state);
                 });
             };
             editor.formatter ? setup() : editor.on('init', setup);
         }
     })

     editor.addButton("cap4", {
        tooltip: "Sub sub sub título",
        text: "Cap 1.1.1.1",
        onClick: function () {
            editor.focus();
            x = editor.selection.getContent();
            editor.selection.setContent('<h4>' + editor.selection.getContent() + '</h4>');
            teste(x);
        
      },
         onPostRender: function() {
             var self = this, setup = function() {
                 editor.formatter.formatChanged("cap4", function(state) {
                     self.active(state);
                 });
             };
             editor.formatter ? setup() : editor.on('init', setup);
         }
     })
});