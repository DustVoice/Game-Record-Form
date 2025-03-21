# Go/Baduk/Weiqi Game Record Form (Kifu)

This is a printable and adaptable template for producing a [**Game Record Form**](https://senseis.xmp.net/?GameRecordForm).
Some people mistakenly call it _Kifu_, which however describes a **completed** game record (see the [article on Sensei's Library](https://senseis.xmp.net/?GameRecord)).

## Language/Tool of choice

It is written in [Typst](https://typst.app) and uses two external packages, available from [Typst Universe](https://typst.app/universe).

## Parametric design

I tried to keep it farely parametric, so everyone, even with minimal typst skills, should be able to modify the template to their needs.
You can either modify the `gen(...)` method directly, or call it with some predefined parmaters, to generate a multitude of board and page sizes.

## Output

The default file generates a PDF with forms for the board sizes `19x19`, `13x13` and `9x9` to be printed on A4 paper.
It alternates between a full A4 page and two A5 pages printed on a single A4 sheet.

## PDF generation

You can find a pregenerated PDF under the Releases section in GitHub, do keep in mind though, that I probably won't be updating it that frequently.

> Creating an account on [typst.app](https://typst.app) should be free and enables you to simply copy and paste the single file into the editor, make changes and generate an up-to-date PDF, all without installing anything.
>
> I'm in no way afilliated with the website, I'm simply a user :)

## Notes

Keep in mind that I created this design primarily for my personal usage.
I wasn't satisfied with the available options, so I decided to create a "modern" version.

If you have different preferences when it comes to line weight, color, etc., that is completely fine,
but please understand that I'm not aiming to support any individual preferences.
The file should be cleaned up enough and legible that even someone with minimal coding skills could modify the parameters.

Also note that I didn't go through the hassle (yet) of turning it into a module, etc.,
as the result satisfies my need (for the moment).
This comes at a cost of modularity, but enables a copy-paste approach of a single file for modification in the online Typst Editor.

If you want to contribute, e.g. if you find egregious mistakes, etc., I can't, won't and don't want to stop you from forking the repository, making the desired changes and opening a pull request with your improvements (changing the color to blue, however, is not an egregious mistake in my eyes and falls under personal preference ... You get the point).

# License

<p xmlns:cc="http://creativecommons.org/ns#" >This work by <span property="cc:attributionName">David Holland</span> is licensed under <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">CC BY-NC-SA 4.0<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/nc.svg?ref=chooser-v1" alt=""><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1" alt=""></a></p>
