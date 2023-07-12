import React, {useCallback, useState} from 'react';
import css from './faq-item.module.scss';
import {cn} from "../../helpers/react.helper";

export interface IFaqItemProps extends React.HTMLAttributes<HTMLDivElement> {
    question:   string;
    answer:     string;
}

const FaqItem: React.FC<IFaqItemProps> = (props) => {
    const [opened, setOpened] =     useState<boolean>(false);
    const toggle =                  function (): void {
                                        setOpened((prev) => !prev);
                                    }

    return (
        <div className={cn(css.container, opened ? css.opened : undefined)}
             onClick={toggle}
             itemType="https://schema.org/Question"
             itemScope
        >
            <div className={css.header}>
                <div className={css.question}
                     itemProp="name"
                >
                    {props.question}
                </div>
                <div className={css.icon}/>
            </div>
            <div className={css.footer}
                 itemProp="acceptedAnswer"
                 itemType="https://schema.org/Answer"
                 itemScope
            >
                <div className={css.answer}
                     itemProp="text"
                >
                    {props.answer}
                </div>
            </div>
        </div>
    );
};

export default FaqItem;