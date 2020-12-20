use image::imageops::{overlay, Lanczos3, Triangle};
use image::{open, Rgba, RgbaImage};
use imageproc::drawing::{draw_filled_rect_mut, draw_text_mut};
use imageproc::rect::Rect;
use rusttype::{Font, Scale};
use std::path::Path;

#[rustler::nif]
fn draw_reddit_profile(karma: String, username: String, avatar_hash: String, id: i64) -> String {
    let mut image = RgbaImage::new(475, 350);
    let path = Path::new("./assets/reddit/profile.png");
    let font = Vec::from(include_bytes!("../dev/fonts/SofiaProRegular.ttf") as &[u8]);
    let font = Font::try_from_vec(font).unwrap();
    let (white, blue, grey, black) = (
        Rgba([255u8, 255u8, 255u8, 255u8]),
        Rgba([51u8, 168u8, 255u8, 255u8]),
        Rgba([124u8, 124u8, 124u8, 255u8]),
        Rgba([0u8, 0u8, 0u8, 255u8]),
    );
    let (scale_small, scale_medium, scale_large) = (
        Scale::uniform(18.0),
        Scale::uniform(20.0),
        Scale::uniform(24.0),
    );
    draw_filled_rect_mut(&mut image, Rect::at(0, 0).of_size(475, 130), blue);
    draw_filled_rect_mut(&mut image, Rect::at(0, 130).of_size(475, 220), white);
    draw_text_mut(&mut image, black, 25, 150, scale_medium, &font, &username);
    draw_text_mut(&mut image, grey, 53, 231, scale_small, &font, &karma);
    draw_text_mut(&mut image, black, 25, 195, scale_large, &font, "Karma");
    draw_text_mut(&mut image, black, 25, 275, scale_large, &font, "Followers");
    draw_text_mut(&mut image, black, 235, 195, scale_large, &font, "Cake Day");
    let avatar_bytes = reqwest::blocking::get(&format!(
        "https://cdn.discordapp.com/avatars/{}/{}.jpg",
        id, avatar_hash,
    ))
    .unwrap()
    .bytes()
    .unwrap();
    let avatar = image::load_from_memory(&avatar_bytes)
        .unwrap()
        .resize(125, 125, Lanczos3);
    overlay(&mut image, &avatar, 25, 15);
    let karma_logo = open("./assets/reddit/logos/karma.png")
        .unwrap()
        .resize(24, 24, Triangle);
    overlay(&mut image, &karma_logo, 25, 227);
    image.save(path).unwrap();
    return String::from("./assets/reddit/profile.png");
}

rustler::init!("Elixir.Valeria.Native", [draw_reddit_profile]);
