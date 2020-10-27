read -p "Enter no of times to flip single coin:" n
echo "Triplet Combination"

declare -A dictionary3=(  [HHH]=0 [HHT]=0 [HTH]=0 [THH]=0 [HTT]=0 [THT]=0 [TTH]=0 [TTT]=0 )
for(( flip = 1; flip <= n; flip++ ))
do
    echo -n "Flip-$flip is "
    (( toss = RANDOM % 8 ))
    case $toss in
        0)
            echo "Heads Heads Heads"
            (( dictionary3[HHH]++ )) 
            ;;
        1)
            echo "Heads Heads Tails"
            (( dictionary3[HHT]++ ))
            ;;
        2)
            echo "Heads Tails Heads"
            (( dictionary3[HTH]++ ))
            ;;
        3)
            echo "Tails Heads Heads"
            (( dictionary3[THH]++ ))
            ;;
        4)
            echo "Heads Tails Tails"
            (( dictionary3[HTT]++ )) 
            ;;
        5)
            echo "Tails Heads Tails"
            (( dictionary3[THT]++ ))
            ;;
        6)
            echo "Tails Tails Heads"
            (( dictionary3[TTH]++ ))
            ;;
        7)
            echo "Tails Tails Tails"
            (( dictionary3[TTT]++ ))
            ;;
    esac
done

for combination in ${!dictionary3[@]}
do
    count=${dictionary3[$combination]}
    percentage=$( echo "$count $n" | awk '{printf "%.2f", $1 * 100 / $2}')
    echo "percentage of $combination is $percentage"   
done



