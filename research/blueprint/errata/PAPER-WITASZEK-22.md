# Mistakes in Witaszek, *Keel's base point free theorem and quotients in mixed characteristic*

Original errata worker: Claude Code, session `cc-fb70e5`, 22 September 2026. Independent reviewer: Codex, session `codex-7e92bd`, job `REV-ERRATA-PAPER-WITASZEK-22`, 23 September 2026. The adjacent JSON now contains twelve confirmed findings with individual review reasons.

The review collated the [published article](https://par.nsf.gov/servlets/purl/10429755), Annals 195 (2022), 655–705, with [arXiv v2](https://arxiv.org/pdf/2002.11915v2), dated 23 January 2022. This replaces the original report's publication-access limitation. The published PDF has 51 pages and SHA-256 `d71bd9254d80145a84f13059f18d37d6f777008900ab907b14d195bb61414ea0`; v2 has 46 pages and SHA-256 `5ab792128995b0735311a5284620e5d14549ecc6c5be08595c5d8cdffedda842`.

The [journal record](https://annals.math.princeton.edu/2022/195-2/p04), [Crossref record](https://api.crossref.org/works/10.4007/annals.2022.195.2.4), [arXiv history](https://arxiv.org/abs/2002.11915), author's [Northwestern](https://sites.math.northwestern.edu/lro1793/publications.html) and [Princeton](https://web.math.princeton.edu/~jw0269/publications.html) lists, and targeted correction searches were checked on 23 September 2026. No separate correction was found. E11's bibliography disambiguation is already available in v2, predating the publication error. These are bounded search results.

| Errata ID | Published page; v2 page | Correction | Reach |
|---|---|---|---|
| E1 | 657; 2 | Retain perfect closed residue fields in the introductory EWM summary. | Wording |
| E2 | 662; 7–8 | Add surjectivity to Lemma 2.1. | A stated result |
| E3 | 662; 8 | Reverse the contraction inequality. | Misprint |
| E4 | 701; 43 | Allow an empty generic conductor in Lemma 6.8. | A stated result under the stated conventions |
| E5 | 700–701; 42–43 | Require a moving multiple in the surface criterion. | Proof repair |
| E6 | 664; 9 | Split the field tensor product over an algebraic closure. | Proof repair |
| E7 | 673; 17 | Correct the order of composition. | Misprint |
| E8 | 677; 21 | Exclude index zero from the divisibility assertion. | Misprint |
| E9 | 679; 22 | Refer to Step 2 after the thickening argument. | Misprint |
| E10 | 697–698; 39–40 | Supply codomain Z and put the eventual trivial action on Z′. | Two related notation slips |
| E11 | 703 and 694; 45 and 37 | Distinguish Keel's and Keeler's citation keys. | Bibliography; v2 already distinguishes them |
| E12 | 701–702; 43 | Restrict the upstairs gluing divisor to F before passing to G. | Misprint |

E1 and E3 preserve the original errata IDs: the newer extraction calls these E3 and E1 respectively. E2 and E4–E11 match that extraction's mathematical topics. E10 adds a missing prime observed during this review. Errata E12 is new and unrelated to extraction E12. Extraction E12–E14 concern external Stacks pages, outside this paper's errata list. The extraction was not modified.

## Checks and repairs

**E1–E3.** The informal EWM claim should carry the hypothesis of Corollary 6.7; no counterexample over imperfect fields is claimed. For E2, embed a rational point X in Y=P¹ over a field and take L=O_Y. Its pullback is big in dimension zero, while L is not big because its section count is constantly one. The printed lemma is false, so its reach changes from `nothing` to `a stated result`. The finite-surjective repair applies to the component over V in Proposition 5.2. For E3, P¹→Spec k is the elementary contraction that checks the intended sign.

**E4.** Put K₀=H⁰(F,O_F), avoiding confusion with the line bundle L. The conductor degree is a nonnegative integer less than two. Degree zero gives the empty scheme; degree one gives Spec K₀. The normalization bars matter: F and C_i are on D̄_i. Section 2 refers to Stacks for basic definitions, and [Stacks 004R](https://stacks.math.columbia.edu/tag/004R) requires connected spaces to be nonempty. The old report's absolute assertion about empty spaces is replaced by this explicit convention. Under an empty-allowed convention the change would only clarify wording.

Emptiness occurs in the corollary's setup. Blow up P²_R along a line in its special fibre, with R a mixed-characteristic DVR with perfect residue field. Write E for the exceptional divisor and H for the pulled-back hyperplane. For sufficiently large m take Δ=0, L=mH, A=mH−E and D=E. The blowup is regular, K_X=−3H+E, and A and L−K_X=(m+3)H−E are relatively ample, while L is nef and relatively big. The exceptional divisor is a smooth ruled surface over the line. Its restricted bundle is pulled back from an ample bundle on the line and has Iitaka dimension one, but its normalization conductor is empty. The later gluing needs only at most one point, so the local correction suffices. This changes the literal lemma statement without refuting the main corollary.

**E5.** The review read [Keel's published paper](https://emis.de/ft/50731), pp.279–282. His Lemma 5.2 itself has the weak section hypothesis, which Witaszek repeats accurately. The false assertion is therefore also present in Witaszek's own proof, contrary to the original report's reason for excluding it.

For a counterexample choose an elliptic curve E over C and a non-torsion degree-zero line bundle M. On T=P_E(O⊕M), with the quotient convention, N=O_T(1) is nef, N²=0, and N has degree one on a ruling fibre. Nefness follows because any quotient line bundle of these pulled-back degree-zero summands on a curve has nonnegative degree. The projective bundle formula gives

\[
h^0(T,N^m)=\sum_{j=0}^{m}h^0(E,M^j)=1\quad(m>0).
\]

The sole section vanishes on every fibre, so N is effective but not semiample. The same construction works in characteristic p: take a constant elliptic curve over F_p and its generic point over an algebraic closure of its function field. This point is non-torsion, since all torsion points of the constant curve are algebraic over F_p.

The valid criterion needs two independent sections of a positive power. Resolve a pencil on the surface resolution. Nefness and square zero force the moving part to have square zero and no remaining base points. It defines a fibration; the fixed part is vertical and has zero intersection with every fibre component, hence is a rational combination of whole fibres. A multiple of the original divisor comes from a positive-degree divisor on the base curve. Semiampleness descends to the original normal surface. In Witaszek's application, positive linear growth of χ and bounded h² give h⁰≥χ−h²→∞. Thus the actual input supplies the stronger hypothesis and repairs the proof step.

**E6.** For a real cube root a of 2 and K=Q(a),

\[
T^3-2=(T-a)(T^2+aT+a^2).
\]

The quadratic discriminant −3a² is not a square in the real field K. Hence K⊗_Q K has two field factors, not three copies of K. Over an algebraic closure Ω it splits into [K:Q] copies of Ω. A universal homeomorphism has a singleton geometric fibre, forcing degree one. Both printed versions lack any algebraic-closure bar in the original formula.

**E7–E10.** Domain and codomain force q=p∘g⁻¹. For 1≤i≤p^k,

\[
v_p\!\left(p^i\binom{p^k}{i}\right)=i+k-v_p(i)\ge k,
\]

whereas the expression at zero is one. The sum already separates that term. The thickening case is Step 2, correctly cited by Step 3. In Lemma 6.3, the next diagram supplies m_Z's codomain, and its equality with the projection is imposed only after Z→Z′. This also identifies the intended trivial-action target as Z′.

**E11–E12.** The v2 bibliography and Fujita citation identify Keeler; publication duplicates his key with Keel's. In the final gluing argument Λ is defined on D̄_i, while G is on D_i. Its degree must first be taken on F⊂D̄_i, where Λ≤⌊Δ_{D̄_i}⌋. The finite surjection F→G transfers the resulting bound on the number of gluing points.

These checks establish the recorded mistakes and local repairs, rather than a complete independent proof of every main theorem and cited result. No Lean artifact is requested or compiled.
