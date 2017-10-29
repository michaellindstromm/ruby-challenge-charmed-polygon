class CharmedPolygon

    def odd_polygon(x, arr)

        x_squared = x * x
        insert_nums = []
        if arr == nil
            insert_nums = [*1..x_squared]
        else 
            insert_nums = arr
        end
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

        if arr == nil
            draw_square(x, ordered_arr)
        else
            ordered_arr
        end

        
    end

    def mult_four_polygon(x)
        insert_nums = [*1..(x**2)]
        cols = x
        i = 0
        j = 0

        x4 = x / 4
        x2 = x / 2

        ordered_arr = Array.new(x**2)

        hold_arr = Array.new

        x4.times do |c|
            x.times do |b|
                index = i * cols + j
                if (j < x4)

                elsif (j > x - x4 - 1)
                
                else
                    ordered_arr[index] = insert_nums[index]
                    hold_arr << insert_nums[index]
                end
                j += 1
            end
            i += 1
            j = 0
        end

        x2.times do |c|
            x.times do |b|
                index = i * cols + j
                if (j < x4)
                    ordered_arr[index] = insert_nums[index]
                    hold_arr << insert_nums[index]
                elsif (j > x - x4 - 1)
                    ordered_arr[index] = insert_nums[index]
                    hold_arr << insert_nums[index]
                else
                    
                end
                j += 1
            end
            i += 1
            j = 0
        end

        x4.times do |c|
            x.times do |b|
                index = i * cols + j
                if (j < x4)

                elsif (j > x - x4 - 1)
                
                else
                    ordered_arr[index] = insert_nums[index]
                    hold_arr << insert_nums[index]
                end
                j += 1
            end
            i += 1
            j = 0
        end

        i = x - 1
        j = x - 1

        left_over = insert_nums - hold_arr
        left_over = left_over.reverse

        ordered_arr.length.times do |a|
            if ordered_arr[a] == nil
                ordered_arr[a] = left_over.delete_at(0)
            end
        end

        draw_square(x, ordered_arr)

    end

    def mult_two_polygon(x)
        insert_nums = [*1..(x**2)]
        cols = x
        i = 0
        j = 0

        x4 = x / 4
        x2 = x / 2

        ordered_arr = Array.new

        tl = [*1..((x/2)**2)]
        br = [*(((x/2)**2)+1)..(((x/2)**2))+((x/2)**2)]
        tr = [*((((x/2)**2))+((x/2)**2)+1)..((((x/2)**2))+(((x/2)**2))*2)]
        bl = [*(((((x/2)**2))+(((x/2)**2))*2)+1)..((((x/2)**2))+(((x/2)**2))*3)]

        tl = odd_polygon((x/2), tl)
        br = odd_polygon((x/2), br)
        tr = odd_polygon((x/2), tr)
        bl = odd_polygon((x/2), bl)

        
        left_cols = x/2/2.floor
        
        right_cols = x/2/2 - 1
        
        middle = x/2/2

        i = 0
        j = 0
        cols = x/2
        rows = x/2

        # p left_cols

        # p right_cols

        # p middle


        indices = Array.new

        cols.times do |c|
            rows.times do |b|
                index = i * cols + j

                if i == middle and j == 0

                elsif j < left_cols
                    indices << index
                end

                j += 1

            end
            i += 1
            j = 0
        end

        indices << (cols**2)/2.floor
        
        indices.each do |i|
            tl[i], bl[i] = bl[i], tl[i]
        end

        indices = []
        i = 0
        j = 0

        if right_cols > 0
            cols.times do |c|
                rows.times do |b|
                    index = i * cols + j

                    if j > cols - (right_cols + 1)
                        indices << index
                    end

                    j += 1

                end
                i += 1
                j = 0
            end
        end

        indices.each do |i|
            tr[i], br[i] = br[i], tr[i]
        end

        tl = tl.each_slice(rows).to_a
        tr = tr.each_slice(rows).to_a
        bl = bl.each_slice(rows).to_a
        br = br.each_slice(rows).to_a

        cols.times do |a|

            ordered_arr << tl[a]
            ordered_arr << tr[a]

        end

        cols.times do |a|

            ordered_arr << bl[a]
            ordered_arr << br[a]

        end

        ordered_arr.flatten!

        draw_square(x, ordered_arr)

    end


    private
    def draw_square(x, arr)

        x.times do |r|
            r += 1 
            
            if r != x
                print '+'
                x.times { |c| print '-'}
                x.times do |c| 
                    if c == 0
                        print "------"
                    else
                        print "-------"
                    end
                end
                print '+'
                puts
                print '|'
                single_digits = [*0..9]
                double_digits = [*10..99]
                triple_digits = [*100..999]
                x.times do |c| 
                    num = arr.delete_at(0)
                    if single_digits.include?(num)
                        print "   #{num}   |"
                    elsif double_digits.include?(num)
                        print "  #{num}   |"
                    elsif triple_digits.include?(num)
                        print "  #{num}  |"
                    else
                        print " #{num}  |"
                    end
                end

            else 

                print '+'
                x.times { |c| print '-'}
                x.times do |c| 
                    if c == 0
                        print "------"
                    else
                        print "-------"
                    end
                end
                print '+'
                puts
                print '|'
                single_digits = [*0..9]
                double_digits = [*10..99]
                triple_digits = [*100..999]
                x.times do |c| 
                    num = arr.delete_at(0)
                    if single_digits.include?(num)
                        print "   #{num}   |"
                    elsif double_digits.include?(num)
                        print "  #{num}   |"
                    elsif triple_digits.include?(num)
                        print "  #{num}  |"
                    else
                        print " #{num}  |"
                    end
                end
                puts
                print '+'
                x.times { |c| print '-'}
                x.times do |c| 
                    if c == 0
                        print "------"
                    else
                        print "-------"
                    end
                end
                print '+'

            end
            
           puts
        end


    end

end