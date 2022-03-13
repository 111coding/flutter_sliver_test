# flutter_sliver_test
### 1. Sliver 화면

#### 1.1. ScrollSliverPage
- NestedScrollView
    - Slivers
        - ScrollSliverAppBar
            -  NestedScrollView와 연결된 **스크롤 컨드롤러**를 파라미터로 받아서 해당 컨트롤러에 리스너를 선언해서 스크롤 위치와 프로필영역의 높이의 비율을 계산해서 **투명도**와 **큰 프로필의 사이즈**를 변경(**setState()**)시켜줍니다
        - MiddleSliverAppBar
            - SliverFixedExtentList를 사용해 자연스럽게 스크롤되게 합니다.
        - TabSliverAppBar
            - SliverPersistentHeader의 Delegate를 구현. SliverPersistentHeader의 pinned프로퍼티를 true로 주어 고정하였고 Delegate의 minExtent, maxExtent 값을 동일하게 주어 크기가 변경안되게 하였습니다.



#### 1.2. EasySliverPage
- NestedScrollView
    - Slivers
        - EasySliverAppBar
            -  SliverPersistentHeader Delegate에서 **shrinkOffset** 값으로 **투명도**와 **큰 프로필의 사이즈**의 값을 계산해 주었습니다. ScrollSliverAppBar와 위젯트리 구조는 비슷하지만 스크롤컨트롤러로 계산하냐 delegate의 shrinkOffset값으로 계산하냐의 차이이고 ScrollController가 필요 없기때문에 조금 더 분리된 느낌입니다.
        - MiddleSliverAppBar
            - 공통
        - TabSliverAppBar
            - 공통

#### 1.3. HardSliverPage
- NestedScrollView
    - Slivers
        - HardSliverAppBar
            -  SliverPersistentHeader Delegate에서 **shrinkOffset** 값으로 **offset**을 계산 해 위젯의 위치와 크기를 변경시켜줍니다. 위 두 방법과의 차이로는 위젯의 **크기는 Padding**으로, **위치는 Align**으로 처리하였다는 부분입니다. Padding과 Align을 각각 직접 계산할 필요는 없으며 offset만 계산하여 각각 시작값과 끝값이 선언된 **EdgeInsetsTween**, **AlignmentTween**에 **lerp**을 사용하여 해당 offset일때의 값을 구하였습니다.
        - MiddleSliverAppBar
            - 공통
        - TabSliverAppBar
            - 공통



### 2. Collectable 화면

#### 1.1. ArtDetilPage
- ArtDetailBody
ArtDetilPage 내에서 AppBar의 Text를 바꾸어 주어야 해서 선택된 Collectable index가 변하였을때 실행될 수 있는 함수를 파라미터로 전달하였습니다.
    - NtfGrid
        - Collectable index에 맞게 해당 Collectable의 ntf를 그리드뷰로 보여주는 화면입니다.
    - ArtBottomArea
        - PageView + GridView
            - 전체리스트의 크기를 5로 나눈 값을 반올림 한 수 반큼 페이지를 만들고 각 페이지별로 5개씩의 Collectable위젯이 들어갑니다. 해당 위젯을 클릭했을때 NtfGrid의 내용이 바뀌어야 해서 Collectable index가 변하였을때 실행될 수 있는 함수를 파라미터로 받았습니다. 페이지 인덱스가 변경될 때에는 Collectable index가 바뀐 PageView 내 GridView에서 제일 첫번째 Collectable로 변경되게 구현되어있습니다.




