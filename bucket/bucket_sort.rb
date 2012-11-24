class BucketSort
    def initialize
        sort_list = [1,2,67,12,78,9,10,41]
        sorted_list = sort(sort_list)

        puts sorted_list
    end

    def sort(sort_list)
        # determine bucket types
        # create buckets
        highest = sort_list.max
        bucket_interval = 3
        buckets = {}
        1.step(highest,bucket_interval) { |i|
            buckets[i] = []
        }

        # traverse through array
        # => put into buckets
        sort_list.each do |num|
            buckets.each do |key, bucket|
                if num < key+bucket_interval && num >= key
                    buckets[key] = buckets[key] << num
                end
            end
        end

        # traverse through buckets
        # => sort buckets
        # combine buckets
        sorted_list = []
        buckets.each do |key, bucket|
            sorted_list << bucket.sort
        end

        return sorted_list
    end
end

sorter = BucketSort.new
