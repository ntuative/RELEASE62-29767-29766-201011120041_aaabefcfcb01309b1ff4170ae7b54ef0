package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var _soundChannel:SoundChannel = null;
      
      private var var_1292:Boolean;
      
      private var var_1041:Sound = null;
      
      private var var_439:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         this.var_1041 = param1;
         this.var_1041.addEventListener(Event.COMPLETE,this.onComplete);
         this.var_439 = 1;
         this.var_1292 = false;
      }
      
      public function get finished() : Boolean
      {
         return !this.var_1292;
      }
      
      public function stop() : Boolean
      {
         this._soundChannel.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         this.var_1292 = false;
         this._soundChannel = this.var_1041.play(0);
         this.volume = this.var_439;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return this.var_439;
      }
      
      public function get ready() : Boolean
      {
         return !this.var_1041.isBuffering;
      }
      
      public function get position() : Number
      {
         return this._soundChannel.position;
      }
      
      public function get length() : Number
      {
         return this.var_1041.length;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_439 = param1;
         if(this._soundChannel != null)
         {
            this._soundChannel.soundTransform = new SoundTransform(this.var_439);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         this.var_1292 = true;
      }
   }
}
