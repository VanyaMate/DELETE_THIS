import React from 'react';
import FaqItem from "./components/faq-item/faq-item";
import css from './app.module.scss';

const App = () => {
    return (
        <div className={css.container}>
            <FaqItem question={'Будет ли оно отображаться без текста?'} answer={'Да'}/>
            <FaqItem question={''} answer={'Например вот так'}/>
            <FaqItem question={'Или так'} answer={''}/>
            <FaqItem question={'Ну и если вопрос очень очень большой то это тоже не большая проблема'} answer={'Выглядит конечно топорно, но в целом добавить шрифты и иконку, будет лучше.'}/>
            <FaqItem question={'Знал ли я про микроразметку раньше?'} answer={'Нет. Но выглядит как то что нужно знать.'}/>
        </div>
    );
};

export default App;