extern crate rustler;
use rustler::{Encoder, Env, Error, Term};
use image::{RgbImage};
use std::path::Path;

rustler::rustler_export_nifs! {
    "Elixir.Valeria.Native",
    [
        ("draw_reddit_profile", 2, draw_reddit_profile)
    ],
    None
}

fn draw_reddit_profile<'a>(env: Env<'a>, args: &[Term<'a>]) -> Result<Term<'a>, Error> {
    let _karma: i64 = args[0].decode()?;
    let _username: String = args[1].decode()?;
    let path = Path::new("./assets/reddit/profile.jpg");
    let image = RgbImage::new(400, 400);
    image.save(path).unwrap();
    Ok(("./assets/reddit/profile.jpg").encode(env))
    //very gross, going to improve later
}
