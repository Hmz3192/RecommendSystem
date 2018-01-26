/**
 * tinyImgUpload
 * @param ele [string] [���������Ԫ�ص�ѡ����]
 * @param options [Object] [��������õĻ�������]
 * options�����������
 * path ͼƬ�ϴ��ĵ�ַ·�� ����
 * onSuccess(res) �ļ��ϴ��ɹ���Ļص� ����Ϊ���ص��ı� ����
 * onFailure(res) �ļ��ϴ�ʧ�ܺ�Ļص� ����Ϊ���ص��ı� ����
 * @return [function] [ִ��ͼƬ�ϴ��ĺ���]
 * ���÷���
 * tinyImgUpload('div', options)
 */
function tinyImgUpload(ele, options) {
    // �ж�����Ԫ�غ����Բ�����ӻ���Ԫ��
    var eleList = document.querySelectorAll(ele);
    if(eleList.length == 0){
        console.log('�󶨵�Ԫ�ز�����');
        return;
    }else if(eleList.length>1){
        console.log('���ΨһԪ��');
        return;
    }else {
        eleList[0].innerHTML ='<div id="img-container" >'+
            '<div class="img-up-add  img-item"> <span class="img-add-icon">+</span> </div>'+
            '<input type="file" name="files" id="img-file-input" multiple>'+
            '</div>';
        var ele = eleList[0].querySelector('#img-container');
        ele.files = [];   // ��ǰ�ϴ����ļ�����
    }

    // Ϊ��Ӱ�ť�󶨵���¼�������ѡ��ͼƬ�Ĺ���
    var addBtn = document.querySelector('.img-up-add');
    addBtn.addEventListener('click',function () {
        document.querySelector('#img-file-input').value = null;
        document.querySelector('#img-file-input').click();
        return false;
    },false)

    // Ԥ��ͼƬ
    //����inputѡ���ͼƬ
    function handleFileSelect(evt) {
        var files = evt.target.files;

        for(var i=0, f; f=files[i];i++){
            // ���˵���ͼƬ�����ļ�
            if(!f.type.match('image.*')){
                continue;
            }
            // ���˵��ظ��ϴ���ͼƬ
            var tip = false;
            for(var j=0; j<(ele.files).length; j++){
                if((ele.files)[j].name == f.name){
                    tip = true;
                    break;
                }
            }
            if(!tip){
                // ͼƬ�ļ��󶨵�����Ԫ����
                ele.files.push(f);

                var reader = new FileReader();
                reader.onload = (function (theFile) {
                    return function (e) {
                        var oDiv = document.createElement('div');
                        oDiv.className = 'img-thumb img-item';
                        // ��ͼƬ���������Ԫ��
                        oDiv.innerHTML = '<img class="thumb-icon" src="'+e.target.result+'" />'+
                            '<a href="javscript:;" class="img-remove">x</a>'

                        ele.insertBefore(oDiv, addBtn);
                    };
                })(f);

                reader.readAsDataURL(f);
            }
        }
    }
    document.querySelector('#img-file-input').addEventListener('change', handleFileSelect, false);

    // ɾ��ͼƬ
    function removeImg(evt) {
        if(evt.target.className.match(/img-remove/)){
            console.log('3',ele.files);
            // ��ȡɾ���Ľڵ������
            function getIndex(ele){

                if(ele && ele.nodeType && ele.nodeType == 1) {
                    var oParent = ele.parentNode;
                    var oChilds = oParent.children;
                    for(var i = 0; i < oChilds.length; i++){
                        if(oChilds[i] == ele)
                            return i;
                    }
                }else {
                    return -1;
                }
            }
            // ��������ɾ��ָ�����ļ�����
            var index = getIndex(evt.target.parentNode);
            ele.removeChild(evt.target.parentNode);
            if(index < 0){
                return;
            }else {
                ele.files.splice(index, 1);
            }
            console.log('4',ele.files);
        }
    }
    ele.addEventListener('click', removeImg, false);

    // �ϴ�ͼƬ
    function uploadImg() {
        console.log(ele.files);

        var xhr = new XMLHttpRequest();
        var formData = new FormData();

        for(var i=0, f; f=ele.files[i]; i++){
            formData.append('files', f);
        }

        console.log('1',ele.files);
        console.log('2',formData);

        xhr.onreadystatechange = function (e) {
            if(xhr.readyState == 4){
                if(xhr.status == 200){
                    options.onSuccess(xhr.responseText);
                }else {
                    options.onFailure(xhr.responseText);
                }
            }
        }

        xhr.open('POST', options.path, true);
        xhr.send(formData);

    }
    return uploadImg;
}

