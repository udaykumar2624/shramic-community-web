export default function BlogLayout({ children }) {
  return (
    <div style={{maxWidth:"800px", margin:"auto", padding:"20px"}}>
      <h1 style={{marginBottom:"20px"}}>Shramic Community Blog</h1>
      {children}
    </div>
  );
}