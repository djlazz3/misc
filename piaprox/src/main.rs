fn main() {
    let mut pi:f64 = 3.0;
    let mut denum1:u64 = 2;
    let mut denum2:u64 = 3;
    let mut denum3:u64 = 4;
    let num:u64 = 4;
    for x in 0..101{
        let mut pi1:f64 = (num / (denum1*denum2*denum3)) as f64;
        pi += pi1;
        denum1 += 2;
        denum2 += 2;
        denum3 += 2;
        pi1 = (num/(denum1*denum2*denum3)) as f64;
        pi -= pi1;
        denum1 += 2;
        denum2 += 2;
        denum3 += 2;
    }
    println!("{}",pi);
}
