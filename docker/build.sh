cp -r ../clustering .
cp -r ../detectors .
cp -r ../feature_extractors .
cp -r ../utilities .
cp -r  ../configs .
cp -r ../trackers .
cp -r ../datasets .
cp -r ../evaluation .
cp ../run_tracker.py .
cp ../run_multi_cam_clustering.py .
cp ../util.py .
cp ../start_run_tracker.sh .
cp ../run_evaluation.py .
sudo docker build -t wda_tracker .
