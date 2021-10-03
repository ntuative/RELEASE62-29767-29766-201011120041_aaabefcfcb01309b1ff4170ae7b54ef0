package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.Timer;
   
   public class BinaryFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_38:URLLoader;
      
      protected var _data:String;
      
      protected var var_906:String;
      
      protected var _type:String;
      
      public function BinaryFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         this.var_906 = param2 == null ? "" : param2.url;
         this._type = param1;
         this.var_38 = new URLLoader();
         this.var_38.addEventListener(Event.COMPLETE,loadEventHandler);
         this.var_38.addEventListener(Event.UNLOAD,loadEventHandler);
         this.var_38.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         this.var_38.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         this.var_38.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         this.var_38.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get content() : Object
      {
         return !!this._data ? this._data : (!!this.var_38 ? this.var_38.data : null);
      }
      
      public function get bytesLoaded() : uint
      {
         return !!this.var_38 ? uint(this.var_38.bytesLoaded) : uint(0);
      }
      
      public function get mimeType() : String
      {
         return this._type;
      }
      
      public function get bytesTotal() : uint
      {
         return !!this.var_38 ? uint(this.var_38.bytesTotal) : uint(0);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            this.var_38.removeEventListener(Event.COMPLETE,loadEventHandler);
            this.var_38.removeEventListener(Event.UNLOAD,loadEventHandler);
            this.var_38.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            this.var_38.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            this.var_38.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            this.var_38.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               this.var_38.close();
            }
            catch(e:Error)
            {
            }
            this.var_38 = null;
            this._type = null;
            this._data = null;
            this.var_906 = null;
         }
      }
      
      public function load(param1:URLRequest) : void
      {
         this.var_906 = param1.url;
         this._data = null;
         var_281 = 0;
         this.var_38.dataFormat = this._type == "application/octet-stream" ? "null" : URLLoaderDataFormat.TEXT;
         this.var_38.load(param1);
      }
      
      public function get ready() : Boolean
      {
         return this.bytesTotal > 0 ? this.bytesTotal == this.bytesLoaded : false;
      }
      
      public function get url() : String
      {
         return this.var_906;
      }
      
      private function timerEventHandler(param1:TimerEvent) : void
      {
         var _loc2_:Timer = param1.target as Timer;
         if(_loc2_)
         {
            _loc2_.stop();
            _loc2_.removeEventListener(TimerEvent.TIMER,this.timerEventHandler);
         }
         if(!_disposed)
         {
            loadEventHandler(new Event(Event.COMPLETE));
         }
      }
      
      override protected function retry() : Boolean
      {
         if(!_disposed)
         {
            if(++var_281 < var_2544)
            {
               try
               {
                  this.var_38.close();
               }
               catch(e:Error)
               {
               }
               this.var_38.load(new URLRequest(this.var_906 + (this.var_906.indexOf("?") == -1 ? "?" : "&") + "retry=" + var_281));
               return true;
            }
         }
         return false;
      }
   }
}
