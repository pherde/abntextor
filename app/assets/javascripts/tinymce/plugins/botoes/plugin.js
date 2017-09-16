tinyMCE.PluginManager.add('botoes', function(editor, url) {
  
   editor.addButton("novo-btn", {
        tooltip: "Botão customizado",
        text: "Botão Novo",
        onClick: function () {
        editor.insertContent('&nbsp;<b>Texto inserido pelo botão!</b>&nbsp;');
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
  
});