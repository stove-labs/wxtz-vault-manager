@bs.module("../../static/img/stove_labs.svg") external stoveLabsLogo: 'a = "default"
@bs.module("../../static/img/twitter.svg") external twitterLogo: 'a = "default"
@bs.module("../../static/img/telegram.svg") external telegramLogo: 'a = "default"
@bs.module("../../static/img/github.svg") external githubLogo: 'a = "default"


module Styles = {
    open! Cn
    open Emotion
    open KitchenUiKit.Style

    %%raw(`require('typeface-roboto')`)
    let _fontFamilyRoboto = fontFamily("'Roboto', sans-serif")
    let scoped = "built-by-stove-labs"->scope
    

    module Wrapper = {
        let shared = css(list{
            width(px2rem(202)),
            margin2(#px(0), #auto),
            display(#flex),
            // marginTop(px2rem())
        })

        let className = "wrapper"->scoped

        let make = () => fromList(list{
            shared
        })
    }

    module Logo = {
        let shared = css(list{
            width(px2rem(80)),
        })

        let make = () => fromList(list{
            shared
        })
    }

    module Brand = {
        let shared = css(list{
            _fontFamilyRoboto,
            fontSize(px2rem(10)),
            marginTop(px2rem(18)),
            marginLeft(px2rem(20)),
            select("span", list{
                display(#block)
            }),
            letterSpacing(#rem(0.016)),
            select("span:nth-child(2)", list{
                fontSize(px2rem(20)),
                fontWeight(700),
                marginTop(px2rem(-1))
            })
        })

        let make = () => fromList(list{
            shared
        })

        module Social = {
            let shared = css(list{
                select("img", list{
                    width(px2rem(18)),
                    marginTop(px2rem(2)),
                    marginRight(px2rem(6))
                })
            })
            let make = () => fromList(list{
                shared
            })
        }
    }
}

@react.component
let make = () => {
    <div
        className={Cn.fromList(list{
            Styles.Wrapper.make(),
            Styles.Wrapper.className
        })}
    >
        <div
            className={Cn.fromList(list{
                Styles.Logo.make()
            })}
        >
            <img src={stoveLabsLogo}/>
        </div>
        <div
            className={Cn.fromList(list{
                Styles.Brand.make()
            })}
        >
            <div>
                <span>
                    {React.string("Built by")}
                </span>
                <span>
                    {React.string("Stove Labs")}
                </span>
            </div>
            <div className={Cn.fromList(list{
                Styles.Brand.Social.make()
            })}>
                <img src={twitterLogo}/>
                <img src={githubLogo}/>
                <img src={telegramLogo}/>
            </div>
        </div>
    </div>
}