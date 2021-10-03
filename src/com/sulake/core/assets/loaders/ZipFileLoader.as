package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   
   public class ZipFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_111:URLStream;
      
      protected var _type:String;
      
      protected var var_906:String;
      
      public function ZipFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         this.var_906 = param2 == null ? "" : param2.url;
         this._type = param1;
         this.var_111 = new URLStream();
         this.var_111.addEventListener(Event.COMPLETE,loadEventHandler);
         this.var_111.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         this.var_111.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         this.var_111.addEventListener(Event.OPEN,loadEventHandler);
         this.var_111.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         this.var_111.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return this.var_111.bytesAvailable;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            this.var_111.removeEventListener(Event.COMPLETE,loadEventHandler);
            this.var_111.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            this.var_111.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            this.var_111.removeEventListener(Event.OPEN,loadEventHandler);
            this.var_111.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            this.var_111.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            this.var_111.close();
            this.var_111 = null;
            this._type = null;
            this.var_906 = null;
         }
      }
      
      public function get ready() : Boolean
      {
         return this.bytesTotal > 0 ? this.bytesTotal == this.bytesLoaded : false;
      }
      
      public function load(param1:URLRequest) : void
      {
         this.var_906 = param1.url;
         this.var_111.load(param1);
      }
      
      public function get url() : String
      {
         return this.var_906;
      }
      
      public function get bytesLoaded() : uint
      {
         return this.var_111.bytesAvailable;
      }
      
      public function get mimeType() : String
      {
         return this._type;
      }
      
      public function get content() : Object
      {
         return this.var_111;
      }
   }
}
