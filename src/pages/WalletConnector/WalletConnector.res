
@bs.module("../../static/img/wxtz_logo.svg") external wxtzLogo: 'a = "default"

open KitchenUiKit

module Styles = {
    open! Cn
    open Emotion
    open KitchenUiKit.Style

    module Split = {
        module Left = {
            let shared = css(list{
                backgroundColor(KitchenUiKit.Colors.Secondary.default),
                height(#vh(100.)),
                width(#pct(50.)),
                color(KitchenUiKit.Colors.white),
                display(#inlineBlock),

                select(">div:first-child", list{
                    width(#px(400)),
                    float(#right),
                    position(#relative),
                    top(#pct(20.)),
                    paddingRight(px2rem(120)),
                })
            })

            let make = () => fromList(list{
                shared
            })
        }

        module Right = {
            let shared = css(list{
                height(#vh(100.)),
                width(#pct(50.)),
                display(#inlineBlock),

                select(">div:first-child", list{
                    width(#px(450)),
                    float(#left),
                    position(#relative),
                    top(#pct(20.)),
                    paddingLeft(px2rem(120)),
                }),

                // move this to kitchen-ui card
                select(".plain-card__wrapper", list{
                    display(#inlineBlock) // or width(#fitContent) but doesnt work with bs-emotion
                }),

                select(".ContentButton__wrapper", list{
                    margin2(#px(0), #auto),
                    marginTop(px2rem(32)),
                    textAlign(#center)
                }),

                select("."++BuiltByStoveLabs.Styles.Wrapper.className, list{
                    marginTop(px2rem(64))
                })
            })

            let make = () => fromList(list{
                shared
            })
        }

        
    }

    module Logo = {
        let shared = css(list{
            KitchenUiKit.Typography.slab,

            display(#flex),
            marginBottom(px2rem(32)),

            select("object", list{
                width(px2rem(90))
            }),

            select("h1", list{
                flex(#some(1.,1.,#auto)),
                paddingLeft(px2rem(28)),
                width(#pct(100.)),
                lineHeight(px2rem(40)),
                paddingTop(px2rem(8))
            })
        })

        let make = () => fromList(list{
            shared
        })
    }
}

@react.component
let make = () => {
    <>
        <div
            className={Cn.fromList(list{
                Styles.Split.Left.make()
            })}
        >
            <div>
                <div
                    className={Cn.fromList(list{
                        Styles.Logo.make()
                    })}
                >
                    <object data={wxtzLogo} type_={"image/svg+xml"}></object>
                    <KitchenUiKit.Typography.Heading1>
                        {"wXTZ"->React.string}
                        <br/>
                        {"Vault Manager"->React.string}
                    </KitchenUiKit.Typography.Heading1>
                </div>

                <div>
                    <KitchenUiKit.Typography.Paragraph1>
                        <b>{"Finest management dashboard "->React.string}</b>
                        {"for the wXTZ token issued by StakerDAO. Want to learn more about wXTZ? Read the introductory blog post."->React.string}
                    </KitchenUiKit.Typography.Paragraph1>
                    <br/><br/>
                    <KitchenUiKit.Typography.Paragraph1>
                        <b>{"Disclaimer: "->React.string}</b>
                        {"wXTZ Vault Manager serves for informational purposes only and does not provide any financial advice."->React.string}
                    </KitchenUiKit.Typography.Paragraph1>
                </div>

            </div>
        </div>

        <div
            className={Cn.fromList(list{
                Styles.Split.Right.make()
            })}
        >
            <div>
                <KitchenUiKit.PaddedCard>
                    <KitchenUiKit.Typography.Heading1>
                        {"Welcome stranger"->React.string}
                    </KitchenUiKit.Typography.Heading1>

                    <Typography.Paragraph1>
                        {"Looks like you have not connected your account yet. In
                        order to show you the most relevant information, we need to know your Tezos address first."->React.string}
                    </Typography.Paragraph1>

                    <Typography.Description>
                        {"If you would like to use multiple accounts with the wXTZ Vault Manager, you can pair a different account in the settings later."->React.string}
                    </Typography.Description>

                    <TextButton
                        description={"Pair your wallet using Beacon"}
                        text="Connect account"
                        onClick={_ => ()}
                        icon={#beacon}
                        iconPosition={TextButton.IconPosition.Left}
                        kind={TextButton.Kind.Primary}
                    />
                </KitchenUiKit.PaddedCard>
                
                <BuiltByStoveLabs/>
            </div>
        </div>
    </>
}