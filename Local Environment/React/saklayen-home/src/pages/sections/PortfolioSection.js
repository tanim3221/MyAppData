import React, { useEffect, useState } from 'react';
import { fetchData } from '../../auth/api'
import { CircularProgress } from '@mui/material';
import { getProdDevUrl } from '../../tools/commonFunction';

function Portfolio() {
    const [portfolios, setPortfolio] = useState([]);
    const [portfoliosOriginal, setPortfolioOriginal] = useState([]);
    const [portfolioFilters, setPortfolioFilter] = useState([]);
    const [loading, setLoading] = useState(true);
    const tables = ['portfolio', 'portfolio_filter'];

    useEffect(() => {
        fetchData(tables)
            .then(responseData => {
                const getdata = responseData.saklayen;
                const portfolio = getdata.portfolio;
                const portfolioOrg = getdata.portfolio;
                const portfolioFilter = getdata.portfolio_filter;
                setPortfolio(portfolio);
                setPortfolioOriginal(portfolioOrg);
                setPortfolioFilter(portfolioFilter);
                setLoading(false);
            })
            .catch(error => {
                console.error('Error fetching data:', error);
                setLoading(false);
            });
        // eslint-disable-next-line
    }, []);


    const handleFilter = (itemValue) => {
        const filteredResult = portfoliosOriginal.filter((item) => {
            return item.category.toLowerCase().includes(itemValue);
        });
        setPortfolio(filteredResult);
    };


    const handleResetFilter = () => {
        setPortfolio(portfoliosOriginal);
    };



    function FilterList({ filterData }) {
        return (
            <ul id="filterList">
                <li className='itemFilterPort' onClick={() => {
                    handleResetFilter();
                }}>
                    <span href='#' className="filter btn btn-sm btn-link active">All</span>
                </li>
                {filterData.map(item => (
                    <li className='itemFilterPort' key={item.id}>
                        <span
                            onClick={() => {
                                handleFilter(item.category);
                            }}
                            className="filter btn btn-sm btn-link">
                            {item.text}
                        </span>
                    </li>
                ))}
            </ul>
        );
    }


    return (
        <div className="section-content ">
            {loading ? (
                <div className='spinnerBar'>
                    <CircularProgress
                        style={{
                            color: '#5e2fd6'
                        }}
                    />
                </div>
            ) : (
                <>
                    <div className="page-title">
                        <h2>Portfolio</h2>
                    </div>
                    <div className="row">
                        <div className="col-xs-12 col-sm-12">
                            <div className="portfolio-content">
                                <ul className="portfolio-filters" id="portfolioFilter">
                                    <FilterList filterData={portfolioFilters} />
                                </ul>
                                <div className="portfolio-grid three-columns" id="portfolioGrid">
                                    {portfolios.map(item => (
                                        <figure key={item.id} className="item standard">
                                            <div className="portfolio-item-img">

                                                <img src={`${getProdDevUrl()}/assets/img/${item.imageLink}`} alt={item.name} title={item.category} />
                                                <a href={item.link} target="_blank" rel="noopener noreferrer">
                                                </a>
                                                <i className="lnr lnr-earth"></i>
                                            </div>
                                            <h4 className="name">{item.name}</h4>
                                            <span className="category">{item.category}</span>
                                        </figure>
                                    ))}
                                </div>
                            </div>
                        </div>
                    </div></>
            )}

        </div>
    );
}

export default Portfolio;

