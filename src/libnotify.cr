require "./libnotify/*"

module Libnotify
  @[Link("libnotify")]
  lib C

    enum NotifyUrgency
      NOTIFY_URGENCY_LOW
      NOTIFY_URGENCY_NORMAL
      NOTIFY_URGENCY_CRITICAL
    end

    fun notify_init( app_name : LibC::Char* ) : Bool
    fun notify_uninit() : Void
    fun notify_is_initted() : Bool
    fun notify_get_app_name() : LibC::Char*
    fun notify_set_app_name( LibC::Char* ) : Void

    fun notify_notification_new( summary : LibC::Char*,
                                    body : LibC::Char*,
                                    icon : LibC::Char* ) : Void*

    fun notify_notification_show( notification : Void*,
                                        gerror : Void** ) : Bool

    fun notify_notification_update( notification : Void*,
                                         summary : LibC::Char*,
                                            body : LibC::Char*,
                                            icon : LibC::Char* ) : Bool

    fun notify_notification_set_urgency( notification : Void*,
                                              urgency : Int32 ) : Void*

  end
end
