tinyMCE.PluginManager.add('botoes', function(editor, url) {
  
   editor.addButton("imagem", {
        tooltip: "Inserir imagem usando Latex",
        icon: "image",
        //image: "http://p.yusukekamiyamane.com/icons/search/fugue/icons/calendar-blue.png",
        onClick: function () {
            x = editor.selection.getContent();
            codigo = "<pre style='background: #66b7ff;'>\\begin{figure}[htb]<br />\\immediate \\write18{wget https://endereco_da_sua_imagem.com/nome_imagem.png -O nome_imagem_1.jpg}<br />\\caption{Título da Imagem}<br />\\begin{center}<br />\\includegraphics[width=10cm]{nome_imagem_1}<br />\\end{center}<br />\\legend{Fonte: }<br />\\end{figure}</pre>";
            editor.insertContent(codigo);
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
          x = editor.selection.getContent();
          codigo = "<pre style='background: #66b7ff;'> <br />"+ x +"<br /></pre>";
          editor.selection.setContent(codigo);
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