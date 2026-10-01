# Red team: PAPER-CHENEVIER-TAIBI-20

Codex · session `codex-rtOQ9t` · 2026-10-01 · issue #4300 · complete.

Twelve findings: eight high and four medium. The first seven concern mathematical statements or definitions, the eighth a library boundary, and the final four source provenance, enumeration and ownership. The existing eleven errata remain separate.

The source is the [published 2020 article](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), printed pp. 261–323, SHA-256 `ea90fb0faabeaaa56be15f2c6f9c22450e7891c2181130fd79fe356cd83ba3de`. All 63 pages were read. The [authors’ companion archive](https://otaibi.perso.math.cnrs.fr/levelone/levelone_src_data.tar.gz), SHA-256 `b0bd028b886b91d996d0562798c0800fdf465d7b39dc82eeea1a2e22ec6be87b`, supplies the cited code and data. Source mistakes below are findings against this published text. Their proposed sourceIssue entries still require independent verification.

Repository baseline: `03215c4977dc5a1150e29572014e3dd125ae7924`. The extraction and its accepted review were written by other sessions; this session did neither. All short item names below refer to `PAPER-CHENEVIER-TAIBI-20.result.json`.

## 1. Theorem 3 has two forms with the same weights (high)

**Location:** research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json: items /theorem-3 and /L24; routes[0].brief; sourceIssues

The final uniqueness assertion in Theorem 3 and in the design brief contradicts its PGL₂ case: there are two distinct representations with weights (23/2,−23/2). Existing E2/E10 record their multiplicity in other computations but do not correct this theorem.

**Evidence.** Published pp. 265–266, Theorem 3(i) and its last sentence, says “uniquely determined by their weights”. Both representations in (i) have the same two weights. Section 5.3, pp. 308–309, explicitly distinguishes Δ¹₂₃ and Δ²₂₃. The companion gp/testfin.gp, ex_poids_connus(), stores [[0,0,23],2]; gp/vvalued.gp likewise stores multiplicity 2 for [23/2]. This contradicts uniqueness without using any disputed numerical certificate.

**Correction.** Keep the classification and symplectic self-duality. Restrict uniqueness by weights to cases (ii)–(iv), and state multiplicity two in case (i). Correct the route-1 final theorem and make /L24 notation explicitly conditional on uniqueness, with Δ¹₂₃, Δ²₂₃ the exception. Add a version-of-record sourceIssue for the erroneous final assertion; it affects a stated result, not the total of thirteen.

## 2. The regularity predicate excludes its own double-zero case (high)

**Location:** research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json: item /W-m-regular, dependent /regular-properties; sourceIssues

The exception i=j−1=m/2 is oriented, whereas the quantifier covers every ordered pair i≠j. Thus it never permits equal central zeros: reversing i,j defeats the exception.

**Evidence.** Published p. 264, final definition, has the same quantifier and exception. For m=4, w=(1,0,0,−1), (i,j)=(2,3) is permitted but (3,2) is forbidden. Section 2.2, p. 274, explicitly intends the double-zero case when 4 divides m. Its effective determinant-one Weil representation is I₂⊕1⊕ε, whose three irreducible constituents are distinct.

**Correction.** Quantify over i<j, or replace the index exception by {i,j}={m/2,m/2+1}; preserve all the parity and zero conditions. Add the published misprint to sourceIssues and use the corrected definition in route 1. The example (1,0,0,−1) must satisfy regularity.

## 3. The inversion of w(λ) needs an admissible image and an outer-automorphism convention (high)

**Location:** research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json: item /regular-w-unique-G and route 1; sourceIssues

The claimed existence for every regular w∈W_m is false, and the claimed uniqueness of λ is also false for even special orthogonal groups. These are defects in the stated inverse of the displayed w(λ) map.

**Evidence.** Published p. 268, displayed w(λ), footnote 5 and following paragraph. The regular vector (1,−1)∈W₂ cannot come from any allowed group: the only group with dual standard dimension 2 is SO₃, and its positive weight is λ₁+1/2 with λ₁ integral. Conversely SO₄ has dominant weights (1,1) and (1,−1), both yielding (2,1,−1,−2) because the formula takes |λ₂|. The paper itself later imposes λ_m≥0 for SO₂m in Λ_G(w), p. 292.

**Correction.** Restrict to the image of the listed formulas: m odd ≥3 with integral regular weights; m even with half-integral nonintegral regular weights; or m divisible by 4 with integral regular weights. In the SO_even case impose λ_last≥0, or assert uniqueness only modulo its outer automorphism. Treat m=1, w=(0), separately as the trivial automorphic base case. The all-W_m induction may first return zero for excluded determinant/parity cases. Record both failed clauses of the published inverse assertion under sourceIssues and correct the item and brief accordingly.

## 4. The extraction corrupts the explicit-formula definitions (high)

**Location:** research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json: items /explicit-formula-forms, /C-F-and-POS, /explicit-formula-RS, /prop-2-2

The archimedean integral uses F(t) where the source uses its Fourier transform F̂(t). The finite-prime pairing also loses the conjugate on the first trace and the real part. POS loses Re at complex arguments and attempts to order a generally nonreal Fourier-transform value. These changes alter the objects used by the main positivity method.

**Evidence.** Published p. 275(a): B_f is Re of the sum of F(k log p)(log p)/p^(k/2) times conjugate(tr(c_p(π)^k)) times tr(c_p(π′)^k). Published p. 276, (2.3.4), integrates (Γ′/Γ)(1/2+2πit,U) against F̂(t); the even real test function makes the integral real. Definition 2.1 requires Re F̂(ξ)≥0 in the strip. These decorations were verified on rendered pages, rather than relying on extracted text. For a generic even compactly supported real F, F̂ at a complex point with nonzero real and imaginary parts need not be real.

**Correction.** Restore B_f exactly with conjugation and Re. Put F̂(t) in J_F; retaining Re(Γ′/Γ) inside that integral is equivalent for real even F. Restore Re in POS and explicitly retain the even-real test-function hypotheses and Fourier convention. Restore the source’s real part in the Z definition too, or prove the equivalence using conjugate zero pairs. Propagate these definitions through the positivity and certificate items. This is an extraction error, not a new error in the paper.

## 5. β_Q is not real on its declared unrestricted input domain (high)

**Location:** research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json: item /quadratic-problem and dependent /prop-2-5, /remark-2-10, algorithms; sourceIssues

The definition allows arbitrary U_i∈K_∞ but treats β_Q as a real symmetric form with a least eigenvalue and a minimum. Its epsilon term can be nonreal even for effective U_i. This is independent of the normalization problem already recorded as E3.

**Evidence.** Published p. 278, (2.4.3)–(2.4.4), allows U∈K_∞^r without a determinant restriction. On p. 274, I₀=1⊕ε and ε(I₀)=i, ε(1)=1, so ε(ε)=i. Choose r=2, U₁=1, U₂=ε, δ₁=δ₂=m₁=m₂=1 and a nonzero Odlyzko F with F̂(0)>0. The off-diagonal entry is −J_F(ε)−F̂(0)(1−i)/4, with imaginary part F̂(0)/4. Its value on (e₁+e₂)/√2 is nonreal. The authors’ epsil function in gp/testfin.gp gives the same i.

**Correction.** Add an admissibility condition guaranteeing ε(U_i U_j)∈{−1,1} whenever δ_iδ_j=1, or restrict candidate U_i to effective determinant-one parameters (as for the actual PGL representations). Check that condition before the real matrix and optimization constructions. The latter restriction preserves the paper’s applications: det(U⊗V)=det(U)^dim(V)det(V)^dim(U), and the epsilon character for K_∞ has real value when the determinant is trivial. Add a published-source issue for the overly broad domain; carry the guard through the monotonicity and algorithm statements. Do not silently replace ε by its real part without declaring that different extension.

## 6. Regular infinitesimal character does not imply holomorphic discrete series (high)

**Location:** research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json: item /holomorphic-lowest-weight; sourceIssues

The assertion that the 2g+1 eigenvalues are distinct iff k_g>g is false in the stated nonnegative-weight domain. The extraction repeats the published assertion, so a source correction is needed.

**Evidence.** Published p. 302, last paragraph and footnote 15. Set g=1, k=(0). The unitary lowest-weight module exists (it is the trivial representation); the listed eigenvalues are 0,−1,1, all distinct, whereas k_g>g is false. More generally the scalar weight-zero trivial representation has eigenvalues 0,±1,…,±g. This is an exact counterexample, not a packet conjecture.

**Correction.** Keep the implication k_g>g ⇒ distinct eigenvalues and the separate discrete-series criterion. For an exact regularity test let a_i=k_i−i: require a_i≠0 and a_i+a_j≠0 for i≠j (the a_i are already strictly decreasing). Do not infer discreteness merely from a regular infinitesimal character. Add the p. 302 assertion to sourceIssues; the later k_g>g calculations remain in their proper range.

## 7. The theta parameter relation uses the first-occurrence genus in the wrong place (high)

**Location:** research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json: item /theta-series-properties, route-1 theta layer; sourceIssues

The parameter relation for F=ϑ_g(G) is written with g₀, the degree of G, although F has genus g≥g₀. It fails a dimension check whenever g>g₀ in the square-integrable range.

**Evidence.** Published p. 312, paragraph following (5.3.1), prints ψ_G=ψ_F⊕[n−2g₀−1] (or the reverse expression) for F=ϑ_g(G). But dim ψ_G=n and dim ψ_F=2g+1, so either asserted equality forces g=g₀. For a concrete instance take the unique E₈ lattice eigenform, n=8, g₀=0, g=8. Lemma 5.8 on the same page makes F square integrable and gives ψ_F=ψ_G⊕[9], dimensions 17=8+9. The preceding printed branch instead asserts 8=17+7.

**Correction.** Use the actual lift genus g in the two parameter relations and their inequalities: ψ_G=ψ_F⊕[n−2g−1] when n>2g+1, and ψ_F=ψ_G⊕[2g+1−n] when n<2g+1, in the stated square-integrable setting. Alternatively scope the printed g₀ relation solely to first occurrence and use Lemma 5.8 separately for the higher lifts needed here. Keep g₀ in the degree definition and in the hypotheses of Lemma 5.8. Record this published index error under sourceIssues.

## 8. The integral classical-group library claim conflates point groups and group schemes (high)

**Location:** research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json: item /split-classical-groups; reader library section and route-1 imports

The library item asserts the integral group schemes but cites point-group definitions. Its note also incorrectly says neither library has smooth affine models: the pinned Tau Ceti already constructs and proves smoothness for Sp. The cited determinant-one orthogonal point group alone does not provide the split special orthogonal integral model, especially at residue characteristic two.

**Evidence.** At Tau Ceti f790474, QuadraticForm/OrthogonalGroup.lean:133,290 defines subgroups of linear equivalences, with SO cut out by det=1. Algebra/AlgebraicGroup/Symplectic/Basic.lean:122,209 constructs TauCeti.Symplectic.groupScheme and pointsMulEquiv over every commutative R; Symplectic/Smooth.lean:94 proves Algebra.Smooth R (coordinateHopfAlgebra R m), with no invertibility-of-2 assumption. SpecialOrthogonal/Basic.lean explains that its standard bilinear-form determinant-one scheme differs from the quadratic-form special orthogonal group in characteristic two; its Smooth.lean:83 requires Invertible (2:R). The published §3.2, p. 289, actually uses group schemes and Zariski/fppf exact sequences, not only abstract point groups.

**Correction.** Split the item or make its remaining integral-model obligation explicit. Reuse the existing smooth Sp scheme and its natural point identification. Keep the abstract quadratic isometry groups as partial ingredients; import the split integral orthogonal model from the existing ReductiveGroups Layer 9 (planned Chevalley–Demazure group schemes), with the required identification for the paper’s split quadratic form, instead of marking that identification library. Keep the general ring/Spin constructions in the existing GN.2 source route. Update the reader and imports; do not replan Tau Ceti’s roadmap or assert that its standard sum-of-squares SO scheme is already the paper’s split model over Z.

## 9. The SO₃ character formula was silently corrected (medium)

**Location:** research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json: item /so3-example and sourceIssues

The item correctly changes the denominator in the paper’s character formula but does not record the printed error in sourceIssues, despite the explicit source-faithfulness rule.

**Evidence.** Published p. 271, immediately before the 5×5 matrix, has denominator sin(2π/i); the extraction uses sin(π/i). For k=0 and i=4 the printed ratio is 1/√2, whereas the trivial representation has character 1, as the first matrix row confirms. At i=2 the printed denominator is zero.

**Correction.** Keep the item’s corrected denominator sin(π/i). Add a version-of-record misprint entry with this locator, the small character check and the correction. The displayed matrix and the resulting masses already use the intended formula; do not change them.

## 10. The rationality note silently reverses the sign of the source’s integer range (medium)

**Location:** research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json: item /masses-rational.note and sourceIssues

The note presents a corrected sentence as a quotation from the paper: it changes non-negative to non-positive integers without recording the source error.

**Evidence.** Published p. 270, explanation after (1.4.5), says “non-negative integers”; /masses-rational.note instead says non-positive. The positive-integer statement cannot hold as written: the trivial Artin representation gives ζ(2)=π²/6, which is not rational. This diagnosis does not challenge rationality of the masses or assert rationality for arbitrary complex Artin characters.

**Correction.** Keep the corrected range needed by the rational motivic L-values in the mass argument, but identify it as a correction rather than a verbatim quotation. Add a sourceIssue for the published sign slip with the ζ(2) check and the existing-correction search. Preserve the character/rationality qualifications of the cited Gross–Siegel application.

## 11. The enumeration mixes parameter shapes, representations and genus zero (medium)

**Location:** research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json: item /section-5-3-1; reader Checks; sourceIssues

The statement gives 199 candidate parameters and 59 accepted parameters in the positive-genus setting, while the note acknowledges that these are shape counts including genus zero and collapsing Δ¹₂₃ with Δ²₂₃. In particular only 58 accepted parameters have g≥1. The note must become a corrected statement with a source issue.

**Evidence.** Published p. 309, §5.3.1, gives 199 and 59 after imposing 1≤g≤12. The authors’ gp/vvalued.gp enumerates shapes, stores multiplicity 2 in Pialg[i][7] but never weights the enumeration by it, and retains the singleton [1]. An independent integer-weight/subset enumeration reproduced 199 shapes/59 accepted including [1]; deleting [1] gives 198/58. Distinguishing the two weight-23 PGL₂ representations gives 223 actual candidates and 58 accepted candidates for g≥1. All 25 additional candidates involving the doubled choice fail the multiplicity test. The 58 accepted cases agree with the 29 rows of Table 5 plus the 29 k>g rows of Table 6.

**Correction.** State the convention explicitly: 199/59 for parameter shapes including genus zero, 198/58 for shapes with g≥1, or 223/58 for actual parameters with g≥1 and the two Δ₂₃ representations distinguished. For the theorem’s positive-genus argument use the last convention (or explain the harmless shape collapse before testing). Add a sourceIssue for the scope/count discrepancy and correct the reader’s claim of a literal reproduction. Preserve Tables 5–6 and their dimension conclusions.

## 12. The GRH route still targets a dropped register layer (medium)

**Location:** research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json: route 6; /grh-rankin-selberg.note; route-1 imports; reader Routes

The GRH statement is sent to AnalyticNumberTheory:AN.6, although the accepted restructuring drops that process layer and assigns RH/GRH statements to AN.3. Existence of an AN.6 id in the assembled atlas is not evidence that it remains an active owner.

**Evidence.** At repository baseline 03215c4977dc5a1150e29572014e3dd125ae7924, research/blueprint/restructure/RS-07.result.json has accepted review REV-FIX-RT-RS-07, dated 2026-09-30. Its owner row assigns zero counts, explicit formulas, zero-density estimates and the RH/GRH statement interface to AnalyticNumberTheory:AN.3, formerly AN.6. The assembled AN.6 stage carries restructured.action=drop with the same transfer. This is an extraction-routing finding, not a request to edit the accepted atlas.

**Correction.** Change route 6 to AnalyticNumberTheory:AN.3, or combine it with route 5 while retaining one route for each missing item. Update /grh-rankin-selberg.note, the new-roadmap import brief and the reader. Keep the GRH-dependent classification conditional.

## Scope and checks

Independence: this session neither extracted nor reviewed PAPER-CHENEVIER-TAIBI-20. Read the accepted result, reader, review JSON and REV-PAPER-CHENEVIER-TAIBI-20 report; the latter is Claude Code cc-7b31c4. Read the confirmed claim on issue #4300. Repository baseline 03215c4977dc5a1150e29572014e3dd125ae7924.

Read the complete 63-page version of record, printed pp. 261–323, including all six tables, formulas, proofs, notes and references. Rendered and checked pp. 264, 266, 268, 270, 271, 274–276, 278, 302–303 and 312 for the relevant formulas. Published PDF SHA-256 ea90fb0faabeaaa56be15f2c6f9c22450e7891c2181130fd79fe356cd83ba3de; same bytes as the extraction.

Compared all 151 extracted items, all 12 routes and 28 prerequisite entries with their uses and statements. Re-read all eleven existing sourceIssues and their accepted review. A cited supplier remains one extraction item under PROTOCOL §16; lack of supplier proof closure or a detailed Lean API is not reported as an extraction defect.

Checked all twelve declarations supporting the five library-status items at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Also inspected the cited Fourier, Rayleigh, digamma, quadratic-form, Clifford and Spin ingredients; distinguished abstract field/point constructions from integral group schemes. Read the additional symplectic and special-orthogonal scheme/smoothness statements at the Tau Ceti pin.

Assembled the current atlas (2907 stages, 8322 edges), read all 17 distinct planned/source destination descriptions and their available reviewed library-coverage entries, and inspected the RS-07 ownership transfer. All 134 missing items currently occur in exactly one route. Searched assembled stages and draft roadmap files for overlap in level-one forms, Siegel forms, Miller vanishing, Odlyzko methods and Niemeier lattices. The extraction already specifies a shared owner with the Boxer–Calegari–Gee proposal; no new duplication finding is claimed.

Acquired the authors’ companion archive, SHA-256 b0bd028b886b91d996d0562798c0800fdf465d7b39dc82eeea1a2e22ec6be87b. Read its README, gp/vvalued.gp, relevant gp/testfin.gp and gp/qfminim_trie.gp formulas, the GRH and j2 worksheets and mass format. Recounted db_w23_mult1: 12293 entries, 12106 negative stored values, 187 unresolved, 181 containing I₂₃ at least twice, dimensions 10–38. The exceptional U has stored value +0.036042164222725545663. Recounted the Sp₁₄ mass-file polynomials modulo P(X)↦P(−X): 2257 polynomials, 1158 orbits. These support existing E1/E3/E5/E6/E7/E8, not additional findings.

Independently enumerated the regular weight≤24 Arthur candidates with integer doubled weights and the signs (5.1.2), (5.1.3), (5.2.1): 199/59 shapes including genus zero; 198/58 positive-genus shapes; 223/58 positive-genus actual parameters when multiplicity two is retained. The report preserves the reproducer. Checked the exact regularity, epsilon, rank and trivial-module counterexamples and the SO₃ character diagnostic.

Consulted the published paper page, arXiv history (only v1 listed), authors’ companion sites/README and search results for Chenevier’s publication page for corrections on 2026-10-01. No correction of the reported passages was located. Direct opening of Chenevier’s publication page returned 502 in the browser; Taïbi /research.html was inaccessible, so neither is claimed fully read. Findings concerning the source are scoped to the published PDF, not to an unexamined later author copy.

Also acquired the cited Mestre 1986 PDF, SHA-256 98150bde6477d77e4fc4983b4176562b62e7df69755446229c45cb7649bea024, and inspected the setup/test-function axioms on pp. 210–212. No full audit of Mestre or the other supplier papers is claimed. No end-to-end rerun of the large Sage/PARI mass computations, no interval certification of every stored decimal, and no Lean build were performed.

The correction search used the [journal record](https://pmihes.centre-mersenne.org/articles/10.1007/s10240-020-00115-z/), [arXiv history](https://arxiv.org/abs/1907.08783), [Taïbi companion page](https://otaibi.perso.math.cnrs.fr/levelone/), [Chenevier companion page](https://gaetan.chenevier.perso.math.cnrs.fr/levelone/) and [publication-page search result](https://gaetan.chenevier.perso.math.cnrs.fr/pub.html). No claim is made that the absence of a located correction proves none exists.

The four other library-status items have the expected core statements: Kronecker, the field spinor norm and its kernel, cyclotomic evaluations at 1, and Deligne’s Γ-factors. The partial Mathlib quadratic nondegeneracy definition uses the radical and a polar-radical rank condition; it must not be mistaken for a perfect pairing over an arbitrary ring. That item is already missing, so this caveat is not a separate full-library finding.

The trace formula, Arthur/Moeglin–Renard/Adams–Johnson inputs, theta correspondence and Böcherer supplier results may remain cited results at extraction scope. In particular the uncertified extra numerical step already disclosed in E6 stays a blueprint proof obligation; this report does not pretend to have certified it.

Validation: `scripts/check_redteam.py`, `research/blueprint/intake.py check-files` on the two deliverables, and `git diff --cached --check`. No Lean file is a deliverable; no Lean compilation was attempted.

## Reproducing finding 11

This standalone Python enumeration uses doubled weights, rejects any repeated weight, and retains only odd total dimensions. Odd-dimensional constituent blocks have d=1, as required by §5.2.1. The epsilon and local-character signs are the displayed formulas in §5.1–5.2.1. Multiplicity two changes candidate counts; none of those extra choices survives the character test. It needs only the standard library and performs no numerical approximation.

```python
import ast,json,itertools,math
from fractions import Fraction
from pathlib import Path
# Parameters carry doubled positive weights, type, multiplicity.
S=[((w,), 'S',2 if w==23 else 1) for w in [11,15,17,19,21,23]]
S += [((a,b),'S',1) for a,b in [(19,7),(21,5),(21,9),(21,13),(23,7),(23,9),(23,13)]]
S += [((23,a,b),'S',1) for a,b in [(13,5),(15,3),(15,7),(17,5),(17,9),(19,3),(19,11)]]
S += [((23,21,17,11,3),'S',1)]
params=S+[((24,18,10,4),'E',1),((24,20,14,2),'E',1),((),'O',1),((22,),'O',1),((24,16,8),'O',1)]
blocks=[]
for idx,(pos,kind,mult) in enumerate(params):
 full=pos+tuple(-w for w in pos)+((0,) if kind=='O' else ())
 for d in ([1] if kind=='O' else range(2 if kind=='S' else 1,26,2)):
  weights=[w+2*t-d+1 for w in full for t in range(d)]
  if max(map(abs,weights))>24 or len(set(weights))!=len(weights):continue
  assert all(w%2==0 for w in weights)
  blocks.append((idx,d,frozenset(weights)))
sets=[((),frozenset())]
for idx,d,w in blocks:
 sets += [(p+((idx,d),),z|w) for p,z in sets if not z&w]
sets=[(p,z) for p,z in sets if len(z)%2==1]
def eps(a,b):
 pa,ka,_=params[a];pb,kb,_=params[b]
 if (ka=='S')==(kb=='S'):return 1
 if kb=='S': pa,pb,ka,kb=pb,pa,kb,ka
 exp=sum(w+1 for w in pa) if kb=='O' else 0
 exp+=sum(2*max(u,v)+2 for u in pa for v in pb)
 assert exp%2==0
 return (-1)**(exp//2)
def valid(p,z):
 positive=sorted((w for w in z if w>0),reverse=True)
 odd_slots=set(positive[::2])
 for idx,d in p:
  pos,kind,_=params[idx];n=2*len(pos)+(kind=='O')
  if n*d%2:continue
  global_sign=math.prod(eps(idx,j)**min(d,e) for j,e in p if j!=idx)
  local_sign=(-1)**(n*d//4) if d%2==0 else (-1)**len(set(pos)&odd_slots)
  if global_sign!=local_sign:return False
 return True
passed=[(p,z) for p,z in sets if valid(p,z)]
print('enumeration all shapes',len(sets),'pass shapes',len(passed))
for label,arr in [('all',sets),('accepted',passed)]:
 print(label,'g>=1 shapes',sum(len(z)>1 for p,z in arr),'g>=1 with multiplicity',sum(math.prod(params[i][2] for i,d in p) for p,z in arr if len(z)>1))
 print(label,'genus0',[(p,z) for p,z in arr if len(z)==1])
assert len(sets)==199 and len(passed)==59
assert sum(len(z)>1 for p,z in passed)==58
```
