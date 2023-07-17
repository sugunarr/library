'use client';
import { FileOutlined, PieChartOutlined, UserOutlined, DesktopOutlined, TeamOutlined, BookOutlined } from '@ant-design/icons';
import { Breadcrumb, Layout, Menu, theme, Avatar, Card, Skeleton, Popover, List } from 'antd';
import { useEffect, useState } from 'react';
import _ from 'lodash';
const { Header, Content, Footer, Sider } = Layout;
const { Meta } = Card;
const Dashboard = () => {
  const [collapsed, setCollapsed] = useState(false);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(true);
  const [userData, setUserData] = useState({});
  const [bookCategories, setBookCategories] = useState([]);
  const [bookList, setBookList] = useState([]);
  const [sidebarItems, setSidebarItems] = useState([]);
  const [filterBY, setFilterBY] = useState('all');
  const [filteredBookList, setFilteredBookList] = useState([]);
  const {
    token: { colorBgContainer },
  } = theme.useToken();

  function getItem(label, key, icon, children) {
    return {
      key,
      icon,
      children,
      label,
    };
  }
  const items = [
    getItem('Dashboard', '1', <UserOutlined />),
    getItem('Books', 'sub2', <FileOutlined />, [getItem('All', 'all'), bookCategories]),
    // getItem('Team', 'sub1', <TeamOutlined />, [getItem('Team 1', '6'), getItem('Team 2', '8')]),
  ];
  const handleNavigtion = (values) => {
    if (values.key == 'all') {
      setFilterBY(values.key);
      setFilteredBookList(bookList);
    } else {
      const id = values.key.split('-');
      console.log("values: ", _.filter(bookList, function (o) { return o.category_id == id[1]; }));
      setFilterBY(id[1]);
      const filteredList = _.filter(bookList, function (o) { return o.category_id == id[1]; })
      filteredList.length > 0 ? setFilteredBookList(filteredList) : setError(true);
    }

  }

  const handleLogout = () => {
    localStorage.removeItem('userData');
    location.replace('/');
  }

  const profileContent = (
    <div>
      <List className='w-[200px]'>
        <List.Item>
          {userData.first_name} {userData.last_name}
        </List.Item>
        <List.Item><a href='#' onClick={handleLogout}>Logout</a></List.Item>
      </List>
    </div>
  );

  useEffect(() => {
    async function fetchData() {
      try {
        const user = JSON.parse(localStorage.getItem('userData'));
        console.log("user: ", user);
        if (!user) {
          location.replace('/');
        }
        setUserData(user);
        const res = await fetch('http://localhost:8081/categories', {
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
          method: "GET",
        })

        // Recommendation: handle errors
        if (!res.ok) {
          throw new Error('Failed to fetch data')
        }
        const categoriesList = await res.json()
        const items = _.map(categoriesList, (val) => {
          return getItem(val.category_name, `s-${val.category_id}`);
        });
        setBookCategories(categoriesList);
        setSidebarItems([
          getItem('Dashboard', '1', <UserOutlined />),
          getItem('Books', 'sub2', <FileOutlined />, [getItem('All', 'all'), ...items]),
        ]);

      } catch (error) {
        console.error(error);
      }
    }
    fetchData();
  }, [])

  useEffect(() => {
    async function fetchData() {
      try {

        const res = await fetch('http://localhost:8081/books', {
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
          method: "GET",
        })

        // Recommendation: handle errors
        if (!res.ok) {
          throw new Error('Failed to fetch data')
        }
        const booksData = await res.json()
        setLoading(false)
        setBookList(booksData);
        setFilteredBookList(booksData);
      } catch (error) {
        console.error(error);

      }
    }
    fetchData();
  }, [])

  return (
    <Layout
      style={{
        minHeight: '100vh',
      }}
    >
      <Sider collapsible collapsed={collapsed} onCollapse={(value) => setCollapsed(value)}>
        <div className="demo-logo-vertical h-[50px]" />
        <Menu theme="dark" onClick={(e) => handleNavigtion(e)} defaultSelectedKeys={['1']} mode="inline" items={sidebarItems} />
      </Sider>
      <Layout>
        <Header
          style={{
            padding: 0,
            background: colorBgContainer,
          }}
          className='pl-[10px] text-xl '
        >
          <div className='grid grid-cols-4 pt-[10px] w-[12%] float-left'>
            <div className='text-right'>
              <BookOutlined className='inline-block' /></div>
            <div>
              <h1 className='inline-block pl-[5px] pt-[5px]'>Bookhouse</h1></div>
          </div>
          <div className='float-right pt-[10px] pr-[10px]'>
            <Popover placement="bottom" content={profileContent} trigger="click">
              <Avatar className='cursor-pointer bg-[#f56a00]'>
                {userData?.username?.charAt(0)}
              </Avatar>
            </Popover>
          </div>
        </Header>
        <Content
          style={{
            margin: '16px',
          }}
        >
          {/* <Breadcrumb
            style={{
              margin: '16px 0',
            }}
          >
            <Breadcrumb.Item>User</Breadcrumb.Item>
            <Breadcrumb.Item>Bill</Breadcrumb.Item>
          </Breadcrumb> */}
          <div
            className='grid grid-cols-4 gap-4'
          >
            {bookList.length && filteredBookList?.map((book, i) => (
              <Card cover={<img alt={book.title} src={`https://prodimage.images-bn.com/lf?set=key%5Bresolve.pixelRatio%5D,value%5B1%5D&set=key%5Bresolve.width%5D,value%5B600%5D&set=key%5Bresolve.height%5D,value%5B10000%5D&set=key%5Bresolve.imageFit%5D,value%5Bcontainerwidth%5D&set=key%5Bresolve.allowImageUpscaling%5D,value%5B0%5D&set=key%5Bresolve.format%5D,value%5Bwebp%5D&source=url%5Bhttps://prodimage.images-bn.com/pimages/${book.isbn}_p0_v14_s600x595.jpg%5D&sink=format%5Bwebp%5D`} />} key={i} hoverable>
                <Skeleton loading={loading} avatar active>
                  <Meta
                    title={book.title}
                    description={`${book.description} - ${book.category_id}`}
                  />
                </Skeleton>
              </Card>
            ))}
          </div>
        </Content>
        <Footer
          style={{
            textAlign: 'center',
          }}
        >
          Ant Design ©2023 Created by Ant UED
        </Footer>
      </Layout>
    </Layout>
  );
};
export default Dashboard;