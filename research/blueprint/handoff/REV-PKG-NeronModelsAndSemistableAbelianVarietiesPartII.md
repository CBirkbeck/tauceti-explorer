# Handoff: REV-PKG-NeronModelsAndSemistableAbelianVarietiesPartII

Reviewer: Claude (session claude-ZcgAKZ), 13 October 2026, issue #9228. Verdict: **accepted**. The full
report is `research/blueprint/reviews/REV-PKG-NeronModelsAndSemistableAbelianVarietiesPartII.md`.

## What was done

- Fixing review of the package written by Codex (codex-hkDwpU, PR #9353), following PACKAGE_REVIEW.md:
  upstream form, fidelity to the 168-node plan, own words, process residue, Suggested.lean shape and
  lean-check, duplication against current TauCetiRoadmap and Tau Ceti a91d3aaf, supplier layers and tiers,
  more than fifty source locators, and the adversarial mathematics pass.
- The end classification (fourteen models, eleven with j ≠ 0) was verified independently by a Tate's
  algorithm over F₂(t) and an exhaustive search of the 2¹⁸ normalized tuples: 2592 survivors in exactly
  fourteen orbits (thirteen of size 192, one of size 96). The code is below, so the errata job and the
  future certificate can reproduce it.
- README: supplier and tier corrections (one-way Néron dependency and parent layers; TraceFormula instead of
  WeilConjectures; SF.0–SF.5; four Stacks inputs and the flat-module patching equivalence as new targets in
  §§1.9 and 1.3; flat base change from JacobianChallenge; Zariski refinement, Kodaira classification,
  Weierstrass presentation and isogeny invariance planned or derived here), duplication boundaries, naming
  unification, merged and repaired Checks, and residue cleanup (841 KB → 679 KB, nothing dropped).
- Suggested.lean: removed the tautological `trace_eq_of_count_eq`; added `reverseWeight_eq_reflect` and a
  negative-control `example`. lean-check before: exit 0, 68 warnings; after: exit 0, 69 warnings; all
  `declaration uses sorry`.

## Target changes to propagate

- New targets here, absent from SchemeAndStackFoundations SF.1/SF.3: `ferrand_flat_patching` (§1.3),
  `etale_lift_along_surjection`, `AlgebraicSpace.diagonal_properties`,
  `representable_of_separated_locallyQuasiFinite` and `separated_of_universallyClosed_surjective` (§1.9).
  If SchemeAndStackFoundations later states them, cite them from there instead.
- The parent NeronModelsAndSemistableAbelianVarieties README (PR #852) says "Part II consumes Layers 2 and 4";
  Part II actually uses Layers 1–4 (Néron models, component groups, §§3.8–3.9 and Layer 4). This only matters
  for that roadmap's downstream list.
- The plan packet still cites WeilConjectures WC.7 for the trace formula and SF.3 for flat patching; the
  package now cites TraceFormula and §1.3. A later packet revision should follow.

## For the maintainer: errata to record (not in `research/errata/REGISTER.md`)

1. Schröer, *There is no Enriques surface over the integers*, arXiv:2004.07025v3: Theorem 10.4 (p. 29) lists
   eight nonzero-j equations and the configuration table in the proof of Proposition 11.1 (p. 33) eleven
   configurations. The twisted case of the proof of Theorem 10.4 (pp. 30–31) also gives I₂*+E₄+Ĩ₂,
   I₃*+E₄+Ĩ₁ and IV*+E₄+Ĩ₂ (with I₁ over t²+t+1), equations (t,1,t³,0,0), (t,t,t³,0,0), (t,t²,t²,0,0) in the
   order (a₁,a₂,a₃,a₄,a₆). The paper's §11 exclusion argument may need to treat them.
2. Liu–Lorenzini–Raynaud, Invent. Math. 157 (2004), Theorem 6.6 (p. 496): stated without O_K henselian, but
   the first step of the proof replaces O_K by its strict henselization, which can lower the period of the
   torsor. Counterexample in the package's §3.11: R = C[t]_(t−1), a constant elliptic curve twisted by a
   2-torsion translation along K(√t)/K, period 2 over K, multiplicity-one smooth fibre.

## Reproducing the classification check

Save the three files below in one directory and run them there with Python 3 (no other dependencies).
`python3 check14.py` prints the fibre configuration and rational-point count of each of the fourteen
`rawCandidates` at t = 0, 1, ∞; `python3 search.py` runs the exhaustive search and orbit count (about ten
seconds).

<details><summary>tate2.py — Tate's algorithm over F₂[t] at t = 0, 1, ∞</summary>

```python
# Tate's algorithm over F2[t], places t=0, t=1, t=inf. Polynomials over F2 as Python ints (bit i = coeff of t^i).
import itertools, sys
INF = 10**9
def mul(a,b):
    r=0
    while b:
        if b&1: r^=a
        a<<=1; b>>=1
    return r
def val(p):
    if p==0: return INF
    return (p & -p).bit_length()-1
def bit(p,j): return (p>>j)&1
def deg(p): return p.bit_length()-1
def compose_shift1(p):  # p(t+1)
    r=0; pw=1; i=0
    while p:
        if p&1: r^=pw
        pw=mul(pw,0b11); p>>=1
    return r
def rev(p,w):  # s^w p(1/s), assumes deg p <= w
    assert p==0 or deg(p)<=w, (p,w)
    r=0
    for i in range(w+1):
        if bit(p,i): r|=1<<(w-i)
    return r
def invariants(a):
    a1,a2,a3,a4,a6=a
    b2=mul(a1,a1); b4=mul(a1,a3); b6=mul(a3,a3)
    b8=mul(mul(a1,a1),a6)^mul(mul(a1,a3),a4)^mul(a2,mul(a3,a3))^mul(a4,a4)
    D=mul(mul(b2,b2),b8)^mul(b6,b6)^mul(mul(b2,b4),b6)
    c4=mul(b2,b2)
    return b2,b4,b6,b8,D,c4
def change(a,r,s,t):  # u=1, char 2
    a1,a2,a3,a4,a6=a
    n1=a1
    n2=a2^mul(s,a1)^r^mul(s,s)
    n3=a3^mul(r,a1)
    n4=a4^mul(s,a3)^mul(t^mul(r,s),a1)^mul(r,r)
    n6=a6^mul(r,a4)^mul(mul(r,r),a2)^mul(mul(r,r),r)^mul(t,a3)^mul(t,t)^mul(mul(r,t),a1)
    return (n1,n2,n3,n4,n6)
def scale(a):  # u = t
    ws=(1,2,3,4,6)
    for ai,w in zip(a,ws): assert val(ai)>=w
    return tuple(ai>>w for ai,w in zip(a,ws))
def ev0(p): return p&1
def tate(a):
    """local data at t=0. returns dict(type, r(components), N(Frob-fixed comps), tr (trace on H1), minimal, vD)"""
    nonmin=0
    while True:
        b2,b4,b6,b8,D,c4=invariants(a)
        n=val(D)
        if n==0:
            a1,a2,a3,a4,a6=[ev0(x) for x in a]
            cnt=1
            for x in (0,1):
                for y in (0,1):
                    if (y*y+a1*x*y+a3*y+x**3+a2*x*x+a4*x+a6)%2==0: cnt+=1
            return dict(type='I0',r=1,N=1,tr=3-cnt,count=cnt,j0=(a1==0),minimal=(nonmin==0),vD=0,mult=False)
        # move singular point to (0,0)
        found=None
        for x0 in (0,1):
            for y0 in (0,1):
                A1,A2,A3,A4,A6=[ev0(x) for x in a]
                F=(y0*y0+A1*x0*y0+A3*y0+x0**3+A2*x0*x0+A4*x0+A6)%2
                Fx=(A1*y0+3*x0*x0+2*A2*x0+A4)%2
                Fy=(2*y0+A1*x0+A3)%2
                if F==0 and Fx==0 and Fy==0: found=(x0,y0)
        assert found is not None, a
        a=change(a,found[0],0,found[1])
        a1,a2,a3,a4,a6=a
        assert val(a3)>=1 and val(a4)>=1 and val(a6)>=1
        b2,b4,b6,b8,D,c4=invariants(a)
        if val(b2)==0:
            # T^2 + a1 T - a2 splits over F2?
            A1,A2=ev0(a1),ev0(a2)
            split=any((T*T+A1*T+A2)%2==0 for T in (0,1))
            if split: N,tr=n,1
            else: N,tr=(1 if n%2 else 2),-1
            return dict(type='I%d'%n,r=n,N=N,tr=tr,count=1+2*N-tr,split=split,minimal=(nonmin==0),vD=n,mult=True)
        if val(a6)<2: return dict(type='II',r=1,N=1,tr=0,count=3,minimal=(nonmin==0),vD=n,mult=False)
        if val(b8)<3: return dict(type='III',r=2,N=2,tr=0,count=5,minimal=(nonmin==0),vD=n,mult=False)
        if val(b6)<3:
            A,B=bit(a3,1),bit(a6,2)
            split=any((Y*Y+A*Y+B)%2==0 for Y in (0,1))
            N=3 if split else 1
            return dict(type='IV',r=3,N=N,tr=0,count=1+2*N,split=split,minimal=(nonmin==0),vD=n,mult=False)
        # step 6
        ok=None
        T=0b10
        for r in (0,T,T<<1,T|(T<<1)):
            for s in (0,1):
                for t in (0,T,T<<1,T|(T<<1)):
                    b=change(a,r,s,t)
                    if val(b[0])>=1 and val(b[1])>=1 and val(b[2])>=2 and val(b[3])>=2 and val(b[4])>=3:
                        ok=b;break
                if ok: break
            if ok: break
        assert ok, a
        a=ok
        a1,a2,a3,a4,a6=a
        p=(1,bit(a2,1),bit(a4,2),bit(a6,3))  # T^3 + p1 T^2 + p2 T + p3
        roots=[x for x in (0,1) if (x**3+p[1]*x*x+p[2]*x+p[3])%2==0]
        # derivative 3T^2+2p1T+p2 = T^2 + p2 (char2)
        def mult_root(x):
            d=(x*x+p[2])%2==0
            if not d: return 1
            # second derivative 6T+2p1 = 0 in char 2 -> check triple via P=(T-x)^3: T^3+xT^2+x^2T+x^3
            return 3 if (p[1]==x%2 and p[2]==(x*x)%2 and p[3]==(x**3)%2) else 2
        mults={x:mult_root(x) for x in roots}
        if all(m==1 for m in mults.values()):
            # distinct roots: I0*
            N=2+len(roots)  # central + identity + rational other terminals
            return dict(type='I0*',r=5,N=N,tr=0,count=1+2*N,minimal=(nonmin==0),vD=n,mult=False)
        if any(m==2 for m in mults.values()):
            al=[x for x,m in mults.items() if m==2][0]
            a=change(a,al*T,0,0)
            a1,a2,a3,a4,a6=a
            assert bit(a2,1)==1 and val(a4)>=3-1+1-1 or True
            m=1
            while True:
                a1,a2,a3,a4,a6=a
                if m%2==1:
                    A=bit(a3,(m+3)//2); B=bit(a6,m+3)
                    if A!=0:
                        split=any((Y*Y+A*Y+B)%2==0 for Y in (0,1))
                        N=(m+5) if split else (m+3)
                        return dict(type='I%d*'%m,r=m+5,N=N,tr=0,count=1+2*N,split=split,minimal=(nonmin==0),vD=n,mult=False)
                    a=change(a,0,0,B<<((m+3)//2))
                else:
                    A=bit(a4,m//2+2); B=bit(a6,m+3)
                    assert bit(a2,1)==1
                    if A!=0:
                        split=any((X*X+A*X+B)%2==0 for X in (0,1))
                        N=(m+5) if split else (m+3)
                        return dict(type='I%d*'%m,r=m+5,N=N,tr=0,count=1+2*N,split=split,minimal=(nonmin==0),vD=n,mult=False)
                    a=change(a,B<<(m//2+1),0,0)
                m+=1
                if m>20: raise Exception('loop')
        # triple root
        al=roots[0]
        a=change(a,al*T,0,0)
        a1,a2,a3,a4,a6=a
        assert val(a2)>=2 and val(a4)>=3 and val(a6)>=4, a
        A,B=bit(a3,2),bit(a6,4)
        if A!=0:
            split=any((Y*Y+A*Y+B)%2==0 for Y in (0,1))
            N=7 if split else 3
            return dict(type='IV*',r=7,N=N,tr=0,count=1+2*N,split=split,minimal=(nonmin==0),vD=n,mult=False)
        a=change(a,0,0,B<<2)
        a1,a2,a3,a4,a6=a
        assert val(a3)>=3 and val(a6)>=5
        if val(a4)<4: return dict(type='III*',r=8,N=8,tr=0,count=17,minimal=(nonmin==0),vD=n,mult=False)
        if val(a6)<6: return dict(type='II*',r=9,N=9,tr=0,count=19,minimal=(nonmin==0),vD=n,mult=False)
        a=scale(a); nonmin+=1
        if nonmin>3: raise Exception('nonmin loop')

def places(a):
    """a: global tuple with deg ai <= i. returns local data at 0,1,inf"""
    a0=a
    a1=tuple(compose_shift1(x) for x in a)
    ainf=tuple(rev(x,w) for x,w in zip(a,(1,2,3,4,6)))
    return [tate(a0),tate(a1),tate(ainf)]
def P(s):
    # parse polynomial string like 't^5+t^6' or '1+t'
    s=s.replace(' ','')
    if s=='0': return 0
    r=0
    for term in s.split('+'):
        if term=='1': r^=1
        elif term=='t': r^=2
        else: r^=1<<int(term.split('^')[1])
    return r
def fmt(p):
    if p==0: return '0'
    return '+'.join(('1' if i==0 else ('t' if i==1 else 't^%d'%i)) for i in range(deg(p)+1) if bit(p,i))
```

</details>

<details><summary>check14.py</summary>

```python
import sys; sys.path.insert(0,'.')
from tate2 import *
models=[('t','t','t^2','t^4','t^5+t^6'),('t','0','0','t^3','t^5+t^6'),('t','0','0','t^3','0'),('t','t^2','0','t^3','0'),
('t','0','0','0','t^5'),('t','t^2','0','0','t^5'),('t','t','0','t^4','0'),('t','t','t','t','0'),
('0','t','t^2','0','0'),('0','0','t^2','t^3','0'),('0','0','t^2','0','0'),
('t','1','t^3','0','0'),('t','t','t^3','0','0'),('t','t^2','t^2','0','0')]
for i,m in enumerate(models):
    a=tuple(P(x) for x in m)
    _,_,_,_,D,c4=invariants(a)
    L=places(a)
    tot=sum(d['count'] for d in L)
    desc=' + '.join(d['type']+('' if not d.get('mult') else ('' if d['split'] else '~'))+('(ss)' if d['type']=='I0' and d['j0'] else '')+'[%d]'%d['count'] for d in L)
    print(i+1, m, 'D=',fmt(D), '|', desc, '| total',tot, '| minimal', all(d['minimal'] for d in L))
```

</details>

<details><summary>search.py — exhaustive search and orbit count</summary>

```python
import sys, time; sys.path.insert(0,'.')
from tate2 import *
W=(1,2,3,4,6)
def norm(a):
    a1,a2,a3,a4,a6=a
    return change(a,a2,0,0)  # r=a2 kills a2 in char 2
def hom_sub(p,w,M):
    al,be,ga,de=M
    # sum_k c_k (al t+be)^k (ga t+de)^(w-k)
    L1=(al<<1)|be; L2=(ga<<1)|de
    r=0
    for k in range(w+1):
        if bit(p,k):
            term=1
            for _ in range(k): term=mul(term,L1)
            for _ in range(w-k): term=mul(term,L2)
            r^=term
    return r
MATS=[(a,b,c,d) for a in (0,1) for b in (0,1) for c in (0,1) for d in (0,1) if (a*d+b*c)%2==1]
assert len(MATS)==6
def polys(maxdeg): return range(1<<(maxdeg+1))
TRANS=[(r,s,t) for r in polys(2) for s in polys(1) for t in polys(3)]
assert len(TRANS)==512
def orbit(a):
    out=set()
    for M in MATS:
        b=tuple(hom_sub(x,w,M) for x,w in zip(a,W))
        for (r,s,t) in TRANS:
            c=norm(change(b,r,s,t))
            for x,w in zip(c,W): assert x==0 or deg(x)<=w
            out.add(c)
    return out
def survives(a):
    D=invariants(a)[4]
    if D==0: return None
    try:
        L=places(a)
    except Exception as e:
        return ('ERR',str(e))
    if not all(d['minimal'] for d in L): return None
    if sum(d['count'] for d in L)!=25: return None
    bad=sum(1 for d in L if d['mult'] or (d['type']=='I0' and d['j0']))
    if bad>1: return None
    return L
t0=time.time()
surv={}; errs=[]
for a1 in polys(1):
  for a3 in polys(3):
    for a4 in polys(4):
      for a6 in polys(6):
        a=(a1,0,a3,a4,a6)
        s=survives(a)
        if s is None: continue
        if s[0]=='ERR': errs.append((a,s)); continue
        surv[a]=s
print('survivors',len(surv),'errors',len(errs),'time',time.time()-t0)
for e in errs[:10]: print('ERR',e)
assigned={}; orbits=[]
for a in sorted(surv):
    if a in assigned: continue
    O=orbit(a)
    notsurv=[b for b in O if b not in surv]
    k=len(orbits); orbits.append((a,O,notsurv))
    for b in O: assigned[b]=k
print('orbits',len(orbits),'all survivors assigned',all(a in assigned for a in surv))
for k,(a,O,ns) in enumerate(orbits):
    L=surv[a]
    desc=' + '.join(sorted(d['type']+('' if not d.get('mult') else ('' if d['split'] else '~'))+('(ss)' if d['type']=='I0' and d['j0'] else '')+'[%d]'%d['count'] for d in L))
    print(k, tuple(fmt(x) for x in a), 'j0' if a[0]==0 else 'j!=0', '|', desc, '| orbit size', len(O), 'nonsurvivors in orbit', len(ns))
```

</details>
