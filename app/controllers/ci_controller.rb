class CiController < ApplicationController

  def index
    all_segments
  end

  def show
    data = version_data(params[:segment], params[:version])
  end

  private

  def all_segments
    @segments = $redis.smembers("sql_profile:segments")

    @segments = @segments.inject({}) do |memo, segment|
      seg1, seg2 = segment.split(':')
      
      memo[seg1]       ||= {}
      memo[seg1][seg2] ||= []
      memo[seg1][seg2]  += segment_data(segment)

      memo
    end
  end

  def segment_data(segment)
    versions = $redis.lrange("sql_profile:segments:#{segment}:versions", -10, -1)    

    versions.reverse.collect do |version|
      [ version, version_data(segment, version) ]
    end
  end

  def version_data(segment, version)
    data = $redis.lrange("sql_profile:segments:#{segment}:versions:#{version}", 0, -1)
    data.collect! { |d| JSON.parse(d) }
  end
end
