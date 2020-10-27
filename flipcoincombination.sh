
read -p "Enter no of times to flip single coin:" n
echo "Doublet Combination"
declare -A dictionary2=( [HH]=0 [HT]=0 [TH]=0 [TT]=0 )
for(( flip = 1; flip <= n; flip++ ))
do
    echo -n "Flip-$flip is "
    (( toss = RANDOM % 4 ))
    case $toss in
        0)
            echo "Heads Heads"
            (( dictionary2[HH]++ )) 
            ;;
        1)
            echo "Heads Tails"
            (( dictionary2[HT]++ ))
            ;;
        2)
            echo "Tails Heads"
            (( dictionary2[TH]++ ))
            ;;
        3)
            echo "Tails Tails"
            (( dictionary2[TT]++ ))
            ;;
    esac
done

for combination in ${!dictionary2[@]}
do
    count=${dictionary2[$combination]}
    percentage=$( echo "$count $n" | awk '{printf "%.2f", $1 * 100 / $2}')
    echo "percentage of $combination is $percentage"   
done


