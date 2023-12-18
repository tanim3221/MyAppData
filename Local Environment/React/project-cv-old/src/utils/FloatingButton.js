import { React } from 'react';
import { Search } from '@mui/icons-material';
import extStyles from './styles.module.css';

const FloatingButton = ({ onClick }) => {
    return (
        <div className={extStyles.floatingbutton} onClick={onClick}>
            <Search />
        </div>
    );
};

export default FloatingButton;
