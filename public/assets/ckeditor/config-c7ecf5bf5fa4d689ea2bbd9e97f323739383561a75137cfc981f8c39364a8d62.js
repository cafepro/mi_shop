// /*
// Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
// For licensing, see LICENSE.html or http://ckeditor.com/license
// */

// // The set of styles for the <b>Styles</b> drop-down list.
// CKEDITOR.stylesSet.add( 'default', [
//     // Block Styles
//     { name: 'Grey phone', element: 'span', styles: { 'color': '#6e6c65', 'font-family': 'Roboto', 'font-size': '20px', 'font-weight': 'normal', 'line-height':'24px' } },
//     { name: 'Boton azul', element: 'span', styles: { 'padding': '6px 14px', 'color': '#ffffff', 'font-family': 'Roboto', 'font-size': '13px', 'font-weight': 'bold', 'background':'#89b7df' } },
// ] );

// // CKEDITOR.config.contentsCss = '/assets/ckeditor/contents-2f984ad78c3fcc0586386f0850c78bc6a6e6e9c6aac695464eb1a3f04eaebe6f.css';

// CKEDITOR.editorConfig = function( config )
// {
//   config.extraPlugins = 'sharedspace,dialog,fontawesome,lineutils,widget,templates,sourcedialog';
//   config.allowedContent = true;
//   config.entities = false;
//   // Define changes to default configuration here. For example:
//   config.language = 'es';
//   // config.uiColor = '#AADC6E';

//   /* Filebrowser routes */
//   // The location of an external file browser, that should be launched when "Browse Server" button is pressed.
//   config.filebrowserBrowseUrl = "/ckeditor/attachment_files";

//   // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
//   config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";

//   // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
//   config.filebrowserImageBrowseUrl = "/ckeditor/pictures";

//   // The location of a script that handles file uploads in the Image dialog.
//   config.filebrowserImageUploadUrl = "/ckeditor/pictures";

//   // The location of a script that handles file uploads.
//   config.filebrowserUploadUrl = "/ckeditor/attachment_files";

//   // Rails CSRF token
//   config.filebrowserParams = function(){
//     var csrf_token, csrf_param, meta,
//         metas = document.getElementsByTagName('meta'),
//         params = new Object();

//     for ( var i = 0 ; i < metas.length ; i++ ){
//       meta = metas[i];

//       switch(meta.name) {
//         case "csrf-token":
//           csrf_token = meta.content;
//           break;
//         case "csrf-param":
//           csrf_param = meta.content;
//           break;
//         default:
//           continue;
//       }
//     }

//     if (csrf_param !== undefined && csrf_token !== undefined) {
//       params[csrf_param] = csrf_token;
//     }

//     return params;
//   };

//   config.addQueryString = function( url, params ){
//     var queryString = [];

//     if ( !params ) {
//       return url;
//     } else {
//       for ( var i in params )
//         queryString.push( i + "=" + encodeURIComponent( params[ i ] ) );
//     }

//     return url + ( ( url.indexOf( "?" ) != -1 ) ? "&" : "?" ) + queryString.join( "&" );
//   };

//   // Integrate Rails CSRF token into file upload dialogs (link, image, attachment and flash)
//   CKEDITOR.on( 'dialogDefinition', function( ev ){
//     // Take the dialog name and its definition from the event data.
//     var dialogName = ev.data.name;
//     var dialogDefinition = ev.data.definition;
//     var content, upload;

//     if (CKEDITOR.tools.indexOf(['link', 'image', 'attachment', 'flash'], dialogName) > -1) {
//       content = (dialogDefinition.getContents('Upload') || dialogDefinition.getContents('upload'));
//       upload = (content == null ? null : content.get('upload'));

//       if (upload && upload.filebrowser && upload.filebrowser['params'] === undefined) {
//         upload.filebrowser['params'] = config.filebrowserParams();
//         upload.action = config.addQueryString(upload.action, upload.filebrowser['params']);
//       }
//     }
//   });
// };
