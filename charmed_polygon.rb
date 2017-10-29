class CharmedPolygon

    def create_polygon(x)

        x_squared = x * x
        insert_nums = [*1..x_squared]
        rows = x
        cols = x
        i = 0
        j = (x/2).floor
        pI = 0
        pJ = (x/2).floor

        ordered_arr = Array.new(x_squared)

        x_squared.times do |p|
            
            index = i * cols + j
            if i < 0 and j > x - 1
                i = pI + 1
                j = pJ
                index = i * cols + j
                ordered_arr[index] = insert_nums[p]
                pI = i
                pJ = j
                i -= 1
                j += 1

            elsif i < 0
                i = x - 1
                index = i * cols + j
                ordered_arr[index] = insert_nums[p]
                pI = i
                pJ = j
                i -= 1
                j += 1
                
            elsif j > x - 1
                j = 0
                index = i * cols + j
                ordered_arr[index] = insert_nums[p]
                pI = i
                pJ = j
                i -=1
                j += 1
                
            elsif ordered_arr[index] != nil
                index = ((pI+1) * cols) + pJ 
                ordered_arr[index] = insert_nums[p]
                i = pI
                j = pJ + 1
            else
                index = i * cols + j
                ordered_arr[index] = insert_nums[p]
                pI = i
                pJ = j
                i -= 1
                j += 1
            end

        end

        rows.times do |r|
            r += 1 
            
            if r != x
                print '+'
                cols.times { |c| print '-'}
                cols.times do |c| 
                    if c == 0
                        print "----"
                    else
                        print "-----"
                    end
                end
                print '+'
                puts
                print '|'
                first_nine = [*1..9]
                cols.times do |c| 
                    num = ordered_arr.delete_at(0)
                    if first_nine.include?(num)
                        print "  #{num}  |"
                    else
                        print " #{num}  |"
                    end
                end

            else 

                print '+'
                cols.times { |c| print '-'}
                cols.times do |c| 
                    if c == 0
                        print "----"
                    else
                        print "-----"
                    end
                end
                print '+'
                puts
                print '|'
                first_nine = [*1..9]
                cols.times do |c| 
                    num = ordered_arr.delete_at(0)
                    if first_nine.include?(num)
                        print "  #{num}  |"
                    else
                        print " #{num}  |"
                    end
                end
                puts
                print '+'
                cols.times { |c| print '-'}
                cols.times do |c| 
                    if c == 0
                        print "----"
                    else
                        print "-----"
                    end
                end
                print '+'

            end
            
           puts
        end

    end

end
