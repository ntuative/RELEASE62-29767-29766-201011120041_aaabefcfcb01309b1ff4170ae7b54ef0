package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   
   public class SoundFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_38:Sound;
      
      protected var _type:String;
      
      protected var var_906:String;
      
      public function SoundFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         this.var_906 = param2 == null ? "" : param2.url;
         this._type = param1;
         this.var_38 = new Sound(null,null);
         this.var_38.addEventListener(Event.ID3,loadEventHandler);
         this.var_38.addEventListener(Event.OPEN,loadEventHandler);
         this.var_38.addEventListener(Event.COMPLETE,loadEventHandler);
         this.var_38.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         this.var_38.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return !!this.var_38 ? uint(this.var_38.bytesTotal) : uint(0);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            this.var_38.removeEventListener(Event.ID3,loadEventHandler);
            this.var_38.removeEventListener(Event.OPEN,loadEventHandler);
            this.var_38.removeEventListener(Event.COMPLETE,loadEventHandler);
            this.var_38.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            this.var_38.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            this.var_38 = null;
            this._type = null;
            this.var_906 = null;
            super.dispose();
         }
      }
      
      public function get ready() : Boolean
      {
         return this.bytesTotal > 0 ? this.bytesTotal == this.bytesLoaded : false;
      }
      
      public function load(param1:URLRequest) : void
      {
         this.var_906 = param1.url;
         this.var_38.load(param1,null);
      }
      
      public function get url() : String
      {
         return this.var_906;
      }
      
      public function get bytesLoaded() : uint
      {
         return !!this.var_38 ? uint(this.var_38.bytesLoaded) : uint(0);
      }
      
      public function get mimeType() : String
      {
         return this._type;
      }
      
      public function get content() : Object
      {
         return this.var_38;
      }
   }
}
