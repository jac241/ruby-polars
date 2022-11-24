module Polars
  class DateTimeExpr
    attr_accessor :_rbexpr

    def initialize(expr)
      self._rbexpr = expr._rbexpr
    end

    # def truncate
    # end

    # def round
    # end

    def strftime(fmt)
      Utils.wrap_expr(_rbexpr.strftime(fmt))
    end

    def year
      Utils.wrap_expr(_rbexpr.year)
    end

    def iso_year
      Utils.wrap_expr(_rbexpr.iso_year)
    end

    def quarter
      Utils.wrap_expr(_rbexpr.quarter)
    end

    def month
      Utils.wrap_expr(_rbexpr.month)
    end

    def week
      Utils.wrap_expr(_rbexpr.week)
    end

    def weekday
      Utils.wrap_expr(_rbexpr.weekday)
    end

    def day
      Utils.wrap_expr(_rbexpr.day)
    end

    def ordinal_day
      Utils.wrap_expr(_rbexpr.ordinal_day)
    end

    def hour
      Utils.wrap_expr(_rbexpr.hour)
    end

    def minute
      Utils.wrap_expr(_rbexpr.minute)
    end

    def second
      Utils.wrap_expr(_rbexpr.second)
    end

    def millisecond
      Utils.wrap_expr(_rbexpr.millisecond)
    end

    def microsecond
      Utils.wrap_expr(_rbexpr.microsecond)
    end

    def nanosecond
      Utils.wrap_expr(_rbexpr.nanosecond)
    end

    def epoch(tu = "us")
      if Utils::DTYPE_TEMPORAL_UNITS.include?(tu)
        timestamp(tu)
      elsif tu == "s"
        Utils.wrap_expr(_rbexpr.dt_epoch_seconds)
      elsif tu == "d"
        Utils.wrap_expr(_rbexpr).cast(:date).cast(:i32)
      else
        raise ArgumentError, "tu must be one of {{'ns', 'us', 'ms', 's', 'd'}}, got {tu}"
      end
    end

    def timestamp(tu = "us")
      Utils.wrap_expr(_rbexpr.timestamp(tu))
    end

    def with_time_unit(tu)
      Utils.wrap_expr(_rbexpr.dt_with_time_unit(tu))
    end

    def cast_time_unit(tu)
      Utils.wrap_expr(_rbexpr.dt_cast_time_unit(tu))
    end

    def with_time_zone(tz)
      Utils.wrap_expr(_rbexpr.dt_with_time_zone(tz))
    end

    def cast_time_zone(tz)
      Utils.wrap_expr(_rbexpr.dt_cast_time_zone(tz))
    end

    def tz_localize(tz)
      Utils.wrap_expr(_rbexpr.dt_tz_localize(tz))
    end

    def days
      Utils.wrap_expr(_rbexpr.duration_days)
    end

    def hours
      Utils.wrap_expr(_rbexpr.duration_hours)
    end

    def minutes
      Utils.wrap_expr(_rbexpr.duration_minutes)
    end

    def seconds
      Utils.wrap_expr(_rbexpr.duration_seconds)
    end

    def milliseconds
      Utils.wrap_expr(_rbexpr.duration_milliseconds)
    end

    def microseconds
      Utils.wrap_expr(_rbexpr.duration_microseconds)
    end

    def nanoseconds
      Utils.wrap_expr(_rbexpr.duration_nanoseconds)
    end

    def offset_by(by)
      Utils.wrap_expr(_rbexpr.dt_offset_by(by))
    end
  end
end