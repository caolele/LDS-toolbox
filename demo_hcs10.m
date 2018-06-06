% example of learn LDS for HCS10 dataset

clear
close
addPaths;

disp('Set-ups')
feval('param_hcs10');

disp('Preparing dataset')
imdbPath = fullfile(expDir, sprintf('imdb_%s.mat',isplit{1}));
if exist(imdbPath, 'file')
    imdb = load(imdbPath) ;
else
    imdb = setupData(dbDir,imgDir,isplit{1});
    if ~exist(expDir, 'dir')
        mkdir(expDir) ;
    end
    save(imdbPath, '-struct', 'imdb') ;
end

thisBlocks = getBlocksPerVid(imdb,1);
LDS_opts.stabilizer = 'WLS';
thisLds = getLdsBatch(thisBlocks.data,LDS_opts); 

