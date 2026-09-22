# Honda–Tate theory for Shimura varieties: extraction checkpoint

**Status: partial. Agent: Codex. Session: codex-c83e7a. Issue: #1314. Access date: 22 September 2026.**

The companion JSON contains 172 items: 17 narrowly matched library items, 30 existing-stage contracts, and 125 missing items routed exactly once. Its 73 definitions and constructions have 219 proposed API contracts and 219 specified unit tests. Eight separate exact-arithmetic acceptance checks were executed. These counts do not imply recursive mathematical closure or Lean implementation.

The complete 41-page author paper was read. The remaining work is substantive: final-version reconciliation, original prerequisite proofs, some further declaration splits, the general inner-form branch, Noot's input, and the singular-base coefficient construction. The source also makes genuinely conditional statements; a complete extraction must preserve those conditions rather than prove the conjecture by assumption. Every item retains `implementationStatus: unchecked`.

## Source identity and reading boundary

The paper is Mark Kisin, Keerthi Madapusi Pera and Sug Woo Shin, *Honda–Tate theory for Shimura varieties*, Duke Mathematical Journal 171 (2022), no. 7, 1559–1614, [DOI 10.1215/00127094-2021-0063](https://doi.org/10.1215/00127094-2021-0063). The source actually read is the [Berkeley author PDF](https://math.berkeley.edu/~swshin/HT.pdf), 41 pages, SHA-256 `fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db`. Its creation metadata says 27 January 2021; that is file metadata, not a claimed revision date printed by the authors. The author publication listings associate this paper with the Duke publication. The publisher download returned an HTML challenge/error response. No line-by-line agreement with the final published text is claimed, and the discrepancies below are attributed only to this author PDF.

All pages were read: introduction and conventions, local theory, global special-pair construction, integral reduction and Newton loci, isogeny groups, independence of conjugacy, Tate torsors and CM lifts, all of Appendix A, and references. Images of pages 6, 11, 14, 20 and 37 were inspected to distinguish actual displays from text-extraction damage. Shin's two-page [errata list](https://math.berkeley.edu/~swshin/errata.pdf) was read and had no entry for this paper. That is not evidence that the author PDF has no errors. The Harvard download returned 403; an older parser-visible version was not substituted for the fully read source.

The [Rapoport–Richartz original](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf) was inspected at PDF pages 11, 14, 15, 17–22, with page images 14, 15 and 20. These are selected passages, not the full 30-page file. In the [Kottwitz 1985 original](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), PDF pages 9, 10, 14–16, 20 and 21 were read and page 14 was inspected as an image. Its decency equation confirms the factor count below. The JSON records hashes and exact read scopes for all acquired files. Noot's original proof was identified but not acquired; reading its reproduction in KMPS does not close that source gate.

## What the paper actually supplies

Fix a Hodge-type Shimura datum with its faithful symplectic representation, the source lattice-stabilizer level at p, and sufficiently small away-p level. The normal integral model is the normalization of the closure of the generic canonical model in the ambient Siegel model. General results here do not begin with an unramified group or good reduction assumption. The full lattice fixer, a connected parahoric and a hyperspecial subgroup must remain different notions. Special density corollaries impose additional p and level restrictions.

The local input starts with B(G), its integral Kottwitz invariant and rational Newton orbit. Admissibility requires both integral kappa equality and Newton dominance relative to the Galois average of a dominant Hodge cocharacter. Matching rational slopes alone can lose torsion information. The reduction construction uses the inverse Hodge cocharacter: its convention is B(G,{mu_X inverse}). Condition (1.1.3.1) means an actual representative with Newton map defined over Q_p. An invariant geometric orbit is not itself such a representative. Quasi-split G and basic classes supply the condition; a blanket assertion for arbitrary inner forms does not follow.

Under that representative condition, admissible classes occur in the special fiber, by constructing and reducing an appropriate special Shimura pair. The crystalline tensors do not depend on the characteristic-zero lift. Appendix A is needed to assemble them into sections over the entire potentially singular special fiber, then into a tensor functor with G-structure. Newton semicontinuity yields closed lower loci, nonempty locally closed strata and the stated inclusion of a stratum's closure in the union of lower strata. It does not give the reverse closure inclusion at arbitrary level.

The maximal, or mu-ordinary, locus requires an admissible class with Newton point equal to the averaged Hodge cocharacter. Once that class and the representative condition are supplied, openness and nonemptiness follow. Density uses local integrality of the special fiber and the component argument. The hyperspecial specialization in the source is stated for p>2; the tamely split special-parahoric specialization also invokes Kisin–Pappas. Neither restriction is removed in this extraction. The general inner-form existence assertion in section 1.3.15 remains G-ordinary.

For a geometric special point x, I_x is the rational algebraic group of quasi-endomorphisms preserving the chosen etale and crystalline tensors, including polarization up to scalar. Stable Frobenius centralizers are defined after sufficiently divisible powers. At p the finite-field crystalline centralizer embeds in J_b; the paper does not identify it by definition with the whole sigma-centralizer. The auxiliary split-prime comparison, together with Noot's independence theorem, proves I_x tensor Q_ell = I_ell,x for every prime, including p. This is an automorphism theorem: it discharges the diagonal case of the tensor Tate conjecture.

The next comparison concerns isogenies between two points. P(x,x') is a rational coefficient-scheme of tensor-preserving quasi-isogenies. A geometrically nonempty P need not have a Q-point. Calling the points Qbar-isogenous means that the coefficients in rational Hom are extended to Qbar; it does not mean base-changing the characteristic-p abelian varieties to characteristic zero. General comparison P tensor Q_ell = P_ell for all pairs is Conjecture 2.3.4. PEL A/C permits a proof using classical Tate, the endomorphism tensors and the polarization equation. The general off-diagonal statement does not follow merely because all diagonal groups have been compared.

With G quasi-split at p, no adjoint type-D factor, and that off-diagonal comparison hypothesis, every point has a geometric coefficient-isogeny CM lift with respect to **each maximal torus of I_x**. The torus, its rational embedding into G, its special Shimura pair, the reducing point and the isogeny witness are all output data. A CM abelian variety without the specified tensor comparison is insufficient. PEL types A and C discharge the conjectural hypothesis and give an unconditional geometric lift theorem.

A rational lift requires a further torsor argument. With G_der simply connected and ker1(Q,G_ab)=0, the locally trivial pushed-forward class vanishes. The proof then changes the embedding and special point using (G/T)(Q). It does not prove the original T-torsor was itself trivial. The source obtains rational lifts for type C and A_n with n odd, plus a separately justified unitary case with n even and odd [F+:Q]. In that last remark the cited Hasse principle is for G; the proof must not be rewritten as an unsupported claim about every G_ab.

For PEL type D, the paper sketches an extension using the full disconnected stabilizer G' and leaves its argument as an exercise. That is not the identical connected-G statement. If polarizations are discarded, an endomorphism-compatible Isom locus is an open subset of a rational vector space and geometric nonemptiness gives a rational point. With polarization equations present, this shortcut fails. This explains precisely why the comparison with Zink does not erase the extra rational-lift hypothesis. The final motivic and abelian-type remarks remain prospective discussion, not additional proved targets.

## Source discrepancies and checks that must survive review

1. **Decency, page 6.** Display (1.1.2.2) ends the product with sigma^r(b), giving r+1 factors. The semilinear norm of b sigma raised to r has factors through sigma^(r-1)(b). The later display (1.1.4.1) and Kottwitz85 (4.3.3), inspected in an original page image, use the latter count. For G_m and b=p, the printed endpoint gives valuation r+1 rather than r. Item N09 records the corrected identity and version gate.

2. **Levi normalizer, pages 11–12.** Corollary 1.1.15 prints w in N_G(M)/M. Take G=GL3, M=GL1×GL2 with block sizes (1,2), mu=(0,1,0), and b_M=diag(p,1,1). The class is basic in M. Its dominant G-Newton point is (1,0,0), equal to the dominant Hodge representative, and both G-kappa values are 1. Its M-kappa is (1,0), whereas mu has block kappa (0,1). The block sizes are unequal, so N_G(M)/M is trivial and cannot fix this discrepancy. A permutation in the full Weyl group S3 can move the nonzero coordinate. The finite permutation check below verifies the normalizer obstruction exactly. It does **not** prove that replacing the group by W(G,T) repairs the full non-quasi-split statement. N29 and its downstream branch in N32 remain gated. Corollary 1.1.17's use of the quasi-split Lemma 1.1.13 also requires this audit.

3. **Inverse Hodge class, page 14.** Proposition 1.2.5's displayed conclusion omits the inverse on mu_x, while its proof and Proposition 1.3.10 use the inverse convention. A rank-one nonzero cocharacter distinguishes the classes immediately. The same convention must be checked through Proposition 2.3.11 and the special-torus Frobenius valuation formula. The items use the inverse coherently and flag the printed statement.

4. **Dense-point automorphisms, page 29.** Lemma 2.2.11 assumes irreducibility and dense rational points but does not state reducedness. On Spec(k[epsilon]/epsilon²), with k=Q or F5, epsilon mapped to 2epsilon is a nonidentity automorphism fixing the unique rational point, which is dense. Take W trivial. The corrected contract G16 assumes reduced, irreducible and separated; finite closed equalizers then justify the proof. The actual torus application satisfies those stronger hypotheses. The exact F5 check verifies addition, multiplication and invertibility of the counterexample automorphism.

5. **Tensor-category identification, page 19.** A tensor category generated by a coefficient object can have a proper monodromy subgroup of the stabilizer of a selected list of tensors. Corollary 1.3.13 must produce the required faithful tensor functor with descent, rather than silently identifying those groups. This is G-tensors; it is not claimed to refute the final functor statement.

6. **Maximal Newton class, page 20.** The existence of a mu-ordinary class for an arbitrary inner form and the representative hypothesis needed by Proposition 1.3.10 must both be checked. S15–S19 keep those requirements explicit. No fully proved general counterexample is offered here; the checkpoint records an unresolved scope issue.

7. **Abelian quotient, page 28.** Lemma 2.2.8 uses an auxiliary product with a special torus. A surjection I_x' to I_x alone does not make an arbitrary map I_x' to T to G_ab factor. Its kernel must be shown to vanish under that map; the asserted local factorization needs its actual compatible construction. T23 retains this descent gate. A fiber-product repair, if appropriate, must be proved rather than silently substituted.

8. **Definition displays.** Section 2.1.3 writes a Q_p intersection where the proof of Lemma 2.1.4 uses rational quasi-endomorphisms; T05 uses the latter and flags reconciliation. Section 2.2.6 defines accommodating embeddings with a recursive word where strictly accommodating factors appear to be intended; T19 requires Noot's original definition. Appendix A.2 prints U=D minus S although D is a divisor in S; A07 uses U=S minus D. The divisorial log structure is functions on S invertible on U, rather than the entire additive sheaf j_*O_U. The page 37 image confirms the displayed source wording.

These are different kinds of findings: explicit counterexamples, a verified equation correction, and unresolved proof/scope questions. They are not all asserted to be published-paper errors.

## Existing libraries and atlas ownership

The checked pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every one of the 27 cited baseline declarations was read in its source file with surrounding hypotheses. The JSON includes file paths, lines, file hashes and statement slices. Two full nearby upstream documents were read before planning: ReductiveGroups (355 lines) and RepresentationTheory/RootSystems (453 lines). Their older descriptions of unbuilt work are not treated as current implementation evidence.

Mathlib already supplies Witt vectors, their fraction-field Frobenius, semilinear isocrystal objects, maps and equivalences, and the theorem named `WittVector.isocrystal_classification`. That last theorem assumes dimension **one**. Its name does not justify all-rank Dieudonne–Manin. The existing `DividedPowers` structure is likewise distinct from PD envelopes and the crystalline/log sites.

Tau Ceti already supplies the reductive and torus Hopf-algebra predicates, geometric character and cocharacter lattices, integral duality and Galois-invariant perfect pairing, the dominant chamber and unique dominant representative theorem under its root-system hypotheses, and abelian varieties and finite-surjective isogenies. Those are reused. Rational cocharacters of a reductive group still need a central-direction adapter, and the paper's nonnegative rational coroot cone is not the integral `posRootCone` from RootSystem/Positive. The GL2 half-coroot example tests this distinction. Nothing in the checkpoint proposes to reconstruct these existing carriers.

The reviewed coverage rows read include BG0/BG1 (AUDIT-20), ShimuraData D1/D3/D4 (AUDIT-10), ShimuraVarieties V5/V6 (AUDIT-11), AbelianSchemes A2/A3/A6 (AUDIT-08), PEL M4 (AUDIT-10), and AutomorphicBundles B1 (AUDIT-13). They distinguish the available base carriers from the unbuilt or partial group-theoretic and geometric interfaces. The pinned statement inspection, not an audit declaration name alone, supports each library status. Absence of a row under a newer crystalline or Dieudonne stage ID is not proof of absence in the libraries.

All 211 current roadmap extracts and available proposal/packet/reserved-ID files were screened for ownership. The relevant full campaign documents or exact stage descriptions were then read. ShimuraData owns cocharacters, reflex fields and datum axioms. ShimuraVarieties V4–V8 owns canonical models and the CM generic theory. PELModuli owns its distinct isomorphism, rational and prime-to-p moduli problems, and separates good-prime smoothness from arbitrary-prime normalizations. Its M3 also owns the applicable PEL Hasse/component calculations, so G20 and G23 import M3 rather than re-plan those special cases.

FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 owns Dieudonne theory. AbelianSchemes A4 owns the abelian Serre–Tate deformation comparison and A6 the arithmetic Hom/End and Rosati API. AutomorphicBundles B1 owns absolute Hodge tensors; PadicHodgeTheory R06.5 supplies comparison through its actual comparison dependencies. NeronModels R11.5 owns Neron–Ogg–Shafarevich, and the semistable theory belongs to R11.3. These owner contracts remain planned, not baseline proofs.

The six routes are as follows.

| Route | Owner | Boundary |
| --- | --- | --- |
| Existing source | BunGAndNewtonStrata BG0–BG1 | B(G), J_b, kappa, Newton order, local specialness and the minuscule Levi/transfer source lemmas. |
| Part II | ReductiveGroupsArithmeticPartII | Global torus cohomology and transfer, Serre-condition/Weil points and conjugacy quotients; extends the upstream group roadmap. |
| Part II | ShimuraVarietiesHondaTatePartII | The normal reduction model, crystalline tensors, Newton loci, tensor isogeny groups and precise CM-lift theorems. |
| Part II | CrystallineCohomologyConvergentPartII | Appendix A's logarithmic convergent coefficients over the singular/nonproper setting. |
| Existing source | AbelianSchemesAndArithmeticModuli A6 | Rational End units and Isom loci, Rosati compactness and unpolarized rational-point argument. |
| Reused candidate Part II | AbelianSchemesFiniteFieldsPartII | Classical finite-field Tate, including p, as supplier of the coefficient-isogeny comparison. |

The global arithmetic group continuation is distinct from the already proposed ReductiveGroupsPartII, which covers local topology, buildings, parahorics and the dual group. The Shimura continuation is broader than the fixed split unitary good-prime setting of IgusaVarietiesAndTorsionConcentration. The crystalline continuation respects CR.7's explicit boundary around further singular/nonproper extensions. RD.3's overconvergent coefficient objects and RD.5's rigid-cohomological proper descent do not by themselves prove Appendix A's convergent log coefficient statement.

The last route deliberately uses the candidate ID already proposed by PAPER-SMITH-24. That merged checkpoint has not become an accepted atlas supplier. Its Honda–Tate/classification and point-count proposal should receive this additional finite-field Hom source at design intake. Creating a second finite-field abelian roadmap would duplicate it. FaltingsFinitenessAndIsogenyTheorems R28.4 was inspected: its number-field finiteness argument does not supply finite-field Tate or the crystalline prime. The brief names the exact comparison needed here and requires reconciling the two paper proposals before acceptance.

The dependency graph is acyclic at the extracted-item level. All missing items have one route. Planned stages are imports, not duplicated definitions; no finer verified supplying packet node was found in the inspected inputs. Recursive proof closure is still open, including generic source suppliers for alterations, invariant quotients, finite-field Hom, local cohomology and comparison. Some definitions combine a carrier with its immediate equivalence or structure laws and need further splitting in the eventual blueprint. This is why passing the schema checker does not warrant `complete`.

## API and acceptance design

Each definition/construction has an explicit consumer in `uses`, three operation-specific API statements, and three discriminating unit-test specifications. For B(G), the API tests independence of trivialization by sigma-conjugacy. For admissibility it extracts integral kappa equality separately from dominance. For rational transfer it exposes the Q_p embedding separately from its geometric conjugacy. For the isogeny torsor it exposes coefficient-algebra points without changing the abelian variety's base. For CM lifts it records the torus embedding, special pair and geometric or rational witness separately. For log coefficients it keeps enlargement maps, exact log structure, Frobenius and integral-point specialization as actual data.

Important negative examples include a noninvertible Frobenius on a nonzero module, different integral coinvariants with the same average, a full fixer that is not a connected parahoric, a nontrivial geometrically nonempty torsor, an off-diagonal general Hodge-type pair without a proved tensor Tate theorem, and an overconvergent object used where only convergence has been constructed. Library-item API names are proposed wrappers or reuse contracts; their existence is not implied by the library status of the carrier.

The executable checks use exact integers and rational fractions. They verify: the r-factor decency norm; inverse Hodge sign in G_m; the GL3 normalizer obstruction; equality of the D4 S3/C3 averaging operators; idempotent averaging and lost integral torsion; GL2 Newton order and its half-coroot; the dual-number dense-point counterexample; and the distinction between sufficiently divisible and merely large Frobenius powers. The last uses diag(1,-1), whose even powers centralize more matrices than its odd powers. None of these small checks proves the full structural theorem or constitutes Lean validation.

The following self-contained certificate can be run with Python 3. The companion JSON records its eight successful outcomes.

```python
from fractions import Fraction as Q
from itertools import permutations, product
checks=[]
def passed(name,meaning):checks.append(dict(name=name,result='pass',meaning=meaning))
# Source equation (1.1.2.2): b=p in G_m is fixed by sigma.
for p,r in product([2,3,5],range(1,9)):
    assert p**r != p**(r+1)
passed('Decency factor count','The r-factor norm has valuation r; the displayed r+1-factor product does not.')
assert Q(3)**1 != Q(3)**(-1)
passed('Inverse Hodge sign','The two proposed torus classes already differ for exponent one in G_m.')
# Corollary 1.1.15: normalizer of the (1,2) block Levi in GL3.
mu=(0,1,0); newton=(1,0,0); block=[frozenset([0]),frozenset([1,2])]
perms=list(permutations(range(3)))
def act(w,x):return tuple(x[w[i]] for i in range(3))
def kappaM(x):return (x[0],x[1]+x[2])
normalizer=[w for w in perms if {frozenset(w[i] for i in B) for B in block}==set(block)]
weylM=[w for w in perms if all(frozenset(w[i] for i in B)==B for B in block)]
assert normalizer==weylM and len(normalizer)==2
assert sorted(mu)==sorted(newton) and sum(mu)==sum(newton)==1
assert kappaM(newton)==(1,0)
assert all(kappaM(act(w,mu))==(0,1) for w in normalizer)
assert any(kappaM(act(w,mu))==(1,0) for w in perms if w not in normalizer)
passed('GL3 Levi normalizer counterexample','The relative normalizer quotient is trivial; full Weyl conjugacy, unlike this normalizer, can move the slope-one coordinate.')
# D4 diagram action: index 0 is the central vertex.
S3=[(0,)+(tuple(i+1 for i in w)) for w in permutations(range(3))]
C3=[(0,1,2,3),(0,2,3,1),(0,3,1,2)]
def avg(group,x):return tuple(sum((Q(x[w[i]]) for w in group),Q(0))/len(group) for i in range(len(x)))
for j in range(4):
    x=tuple(int(i==j) for i in range(4));assert avg(S3,x)==avg(C3,x)
passed('D4 orbit averaging','S3 and its C3 subgroup have the same averaging operator on diagram coordinates; their actions are not equal.')
for x in product(range(-2,3),repeat=2):
    y=avg([(0,1),(1,0)],x);assert avg([(0,1),(1,0)],y)==y
assert (Q(1)+Q(-1))/2==0 and 1%2!=0%2
passed('Averaging and integral torsion','Averaging is idempotent but loses the nontrivial Z/2 coinvariant of the sign action.')
ordinary=(Q(0),Q(1)); basic=(Q(1,2),Q(1,2))
assert sum(ordinary)==sum(basic) and basic[0]>=ordinary[0]
assert (ordinary[1]-basic[1])==Q(1,2) and Q(1,2).denominator!=1
passed('Newton order and rational cone','The basic increasing-slope polygon lies above the ordinary one; the dominant difference needs a half-coroot, outside the integral cone.')
# Reducedness in Lemma 2.2.11: Spec(F5[e]/e²).
elements=list(product(range(5),repeat=2))
def add(x,y):return tuple((a+b)%5 for a,b in zip(x,y))
def mul(x,y):return ((x[0]*y[0])%5,(x[0]*y[1]+x[1]*y[0])%5)
def f(x):return (x[0],2*x[1]%5)
assert len({f(x) for x in elements})==25
assert f((0,1))!=(0,1) and f((1,0))==(1,0)
for x,y in product(elements,repeat=2):
    assert f(add(x,y))==add(f(x),f(y)) and f(mul(x,y))==mul(f(x),f(y))
assert [a for a in range(5) if a*a%5==0]==[0]
passed('Nonreduced dense-point counterexample','A nonidentity algebra automorphism fixes the unique F5-point, which is dense in the one-point spectrum.')
# Commutation with diag(1,-1) is stricter than with its square.
def mm(a,b):return tuple(sum(a[2*i+k]*b[2*k+j] for k in range(2)) for i in range(2) for j in range(2))
d=(1,0,0,-1); u=(1,1,0,1)
assert mm(d,u)!=mm(u,d) and mm(mm(d,d),u)==mm(u,mm(d,d))
passed('Divisible Frobenius powers','Even and odd powers have different centralizers; sufficiently divisible cannot be replaced by sufficiently large.')
result=dict(method='Exact Python integer and Fraction arithmetic; mathematical acceptance checks, not Lean verification.',checks=checks,count=len(checks))

print(f"{len(checks)} exact acceptance checks passed")
```

## Remaining prerequisite work

The companion JSON's `prerequisites` gives each source gate, exact consumer IDs, read status and resumption task. These entries mean the required contracts are not yet closed in this extraction; they do not claim that the whole cited paper has no atlas owner.

| Gate | Work needed before completion |
| --- | --- |
| G-source | Obtain final Duke text and reconcile the listed displays, counterexamples and proof issues. |
| G-local | Finish Kottwitz85/97/03 and RR96 classification, minuscule Levi and integral torsion proofs; repair the general Levi branch. |
| G-global | Read Kottwitz86, Langlands, Langlands–Rapoport and Borovoi with exact real/local hypotheses; verify PEL/odd-degree Hasse inputs. |
| G-model | Close Kisin, Kisin–Pappas, Madapusi Pera, Landvogt, compactification and level-specific extension inputs. |
| G-tensors | Close absolute Hodge, Berthelot–Ogus, Wintenberger and the actual Tannakian descent. |
| G-crystal | Read Faltings, Ogus, de Jong and the original log Dieudonne construction; split all nonroutine Appendix A suppliers. |
| G-tate | Prove finite-field Hom comparison at every prime and the rational invertible-locus/dual compatibility. |
| G-noot | Read the original Noot reconstruction and power-descent statements; justify the accommodating and abelian-quotient argument. |
| G-conjecture | Preserve general off-diagonal tensor Tate as a hypothesis, while proving the source PEL and diagonal cases. |
| G-ordinary | Establish the maximal-class existence and rational Newton witness for every claimed inner-form case. |
| G-typeD | Complete the disconnected-group exercise without converting it to a connected-group theorem. |

The paper checker and allowed-file intake checks are required before submission. The additional structural check verifies all IDs, acyclicity, exact-once missing-item routing, API/test coverage and baseline reference coverage. No suggested Lean file is authorized for this paper issue; none was compiled. The handoff gives the order in which to resume and the conditions for changing the status.

## Item index

Statements, prerequisites, API contracts, tests and proof outlines are in the JSON. This index gives stable resumption identifiers and source locators.

| ID | Item | Status | Source locator |
| --- | --- | --- | --- |
| L01 | Witt-vector coefficient carrier | library | §1.1.2, p.5; Appendix A.1 |
| L02 | Frobenius on the Witt fraction field | library | §1.1.2, p.5 |
| L03 | Point-valued isocrystal | library | §1.3.3, p.16 |
| L04 | Morphism of point-valued isocrystals | library | §§1.3.3, 2.3.2 |
| L05 | Rank-one isocrystal classification | library | §1.1.2 torus sanity check |
| L06 | Connected reductive group predicate | library | Notational conventions, p.5 |
| L07 | Algebraic torus predicate | library | §1.1.1 |
| L08 | Geometric character lattice | library | §1.1.1 |
| L09 | Cocharacter lattice and pairing | library | §1.1.1 |
| L10 | Perfect character-cocharacter pairing | library | §1.1.1 |
| L11 | Closed dominant chamber of a root pairing | library | §1.1.1 |
| L12 | Unique dominant representative in a Weyl orbit | library | §1.1.1 |
| L13 | Abelian variety over a field | library | Introduction; §1.3.3 |
| L14 | Geometric isogeny | library | §2.3.1 |
| L15 | Divided-power structure | library | Appendix A.1 |
| P01 | Shimura datum and Hodge-type embedding | planned | §§1.2.3,1.3.1 |
| P02 | Hodge cocharacter and reflex field | planned | §§1.2.3–1.2.4 |
| P03 | Generic canonical Shimura tower | planned | §§1.3.1–1.3.2,2.1.1 |
| P04 | Siegel prime-to-p isogeny moduli | planned | §§1.3.2,2.1.1 |
| P05 | Absolute Hodge tensor realizations | planned | §1.3.4 |
| P06 | Abelian Dieudonne realization | planned | §1.3.3 |
| P07 | Dieudonne-Manin classification beyond rank one | planned | §1.1.2, Kottwitz §4.2 |
| P08 | Good-reduction crystalline comparison | planned | §1.3.3.2–3 |
| P09 | Finite generation of abelian Hom | planned | §2.1.3 |
| P10 | CM abelian varieties have potentially good reduction | planned | §1.3.10 |
| P11 | Finite adelic torus class number | planned | Lemma 2.2.10 |
| P12 | Bruhat-Tits lattice-stabilizer interface | planned | §1.3.2 |
| P13 | Log structure and log crystalline site | planned | Appendix A.1–A.3 |
| P14 | Abelian Serre-Tate deformation | planned | Proposition 1.3.7 |
| N01 | Rational slope protorus | missing | Notational conventions; §1.1.1 |
| N02 | Algebraic fundamental group | planned | Notational conventions, p.5 |
| N03 | Galois-invariant Newton orbit space | planned | §1.1.1 |
| N04 | Newton dominance relation | missing | §1.1.1; RR96 §2.1–2.4, pp.165–166 |
| N05 | Rational cone and integral-cone adapter | missing | §1.1.1; RR96 §2.1 |
| N06 | Sigma-conjugacy set | planned | §1.1.2 |
| N07 | Kottwitz invariant | planned | §1.1.2; RR96 Theorem 1.15 |
| N08 | Newton cocharacter | planned | §1.1.2; Kottwitz85 §4.2–4.4 |
| N09 | Corrected decency identity | missing | §1.1.2.2 versus §1.1.4.1; Kottwitz85 (4.3.3), p.213 |
| N10 | Kottwitz-Newton compatibility | planned | §1.1.2.1; RR96 Theorem 1.15 |
| N11 | Classification by both invariants | planned | §1.1.2.3, citing Kottwitz97 §4.13 |
| N12 | Basic class | planned | §1.1.2 |
| N13 | Classification of basic classes | planned | §1.1.2.3 |
| N14 | Torus norm representative | planned | §1.1.2.4; Kottwitz85 §2.4–2.7, pp.208–209 |
| N15 | Rational Newton representative condition | missing | §1.1.3 |
| N16 | Sufficient conditions for rational Newton representative | missing | §1.1.3; Kottwitz85 §§5.1,6.2 |
| N17 | Sigma-centralizer group | planned | §1.1.4 |
| N18 | Sigma-centralizer and inner Levi | planned | §1.1.4; Kottwitz85 §§5.2,6.5 |
| N19 | Galois average of a dominant Hodge cocharacter | missing | §1.1.5 |
| N20 | Admissible pair and B(G,mu) | missing | §1.1.5.1–2 |
| N21 | Basic class attached to a Hodge cocharacter is admissible | missing | Lemma 1.1.6 |
| N22 | Torus-special admissible pair | missing | Definition 1.1.7 |
| N23 | Elliptic torus supplies a basic admissible pair | missing | Lemma 1.1.8 |
| N24 | Unramified replacement preserving Galois averages | missing | Lemma 1.1.10 |
| N25 | D4 triality orbit replacement | missing | Proof of Lemma 1.1.10, p.9 |
| N26 | Levi basic Newton formula | missing | Lemma 1.1.12 |
| N27 | Quasi-split minuscule Levi lift | missing | Proposition 1.1.13 |
| N28 | Torsion-free kernel in Levi coinvariants | missing | Proof of Proposition 1.1.13; CKV15 Lemma 2.5.12(2) |
| N29 | General rational-Levi minuscule lift requires repair | missing | Corollary 1.1.15 and its proof, pp.11–12 |
| N30 | Transfer of a maximal torus of J_b | missing | §1.1.16 |
| N31 | Existence of local torus transfer in the stated cases | missing | §1.1.16, citing Langlands89 and Kottwitz86 |
| N32 | Specialness for a transferred maximal torus | missing | Corollary 1.1.17 |
| G01 | Prescribed real torus torsor trivial at p | missing | Lemma 1.2.1 |
| G02 | Local-global torus cohomology obstruction sequence | missing | Proof of Lemma 1.2.1; Kottwitz86 (1.1.1), Proposition 2.6 |
| G03 | Auxiliary prime matching complex-conjugation action | missing | Proof of Lemma 1.2.1 |
| G04 | Approximation of maximal tori at finitely many places | missing | Lemma 1.2.2; Harder66 Lemma 5.5.3 |
| G05 | Simply connected local cohomology vanishing | missing | Proof of Proposition 1.2.5, p.15 |
| G06 | Steinberg torsor triviality over L | missing | §§1.1.4,1.1.17,1.3.8,2.1.7 |
| G07 | Real Weyl action and torus cocycle | missing | Proof of Proposition 1.2.5 |
| G08 | Special Shimura pair with prescribed Newton class | missing | Proposition 1.2.5, pp.14–15, versus proof and §1.3.10 |
| G09 | Serre condition for a rational torus | missing | §2.2.3 |
| G10 | Prime-unit in an algebraic group | missing | §2.2.3 |
| G11 | Weil number and Weil point | missing | §2.2.1 |
| G12 | Representation independence of Weil points | missing | §2.2.1 |
| G13 | Serre condition converts units to Weil points | missing | Lemma 2.2.4 |
| G14 | Neat semisimple point | missing | §2.1.8 |
| G15 | Zariski density of neat Weil points | missing | Lemma 2.2.10 |
| G16 | Corrected finite-automorphism comparison on dense points | missing | Lemma 2.2.11, p.29 |
| G17 | Global transfer of maximal tori between inner forms | missing | Corollary 2.2.14 proof |
| G18 | Simply connected derived group and abelianized obstruction | missing | Corollary 2.3.14 proof |
| G19 | Hasse obstruction for the abelian quotient | missing | Corollary 2.3.14 |
| G20 | Simply connected derived PEL group | planned | Corollary 2.3.15; Remark 2.3.16(1), Kottwitz92 §7, Shin11 Lemma 3.1.1 |
| S01 | Normal integral Hodge-type model | missing | §1.3.5 |
| S02 | Extension over a mixed-characteristic DVR | missing | Lemma 1.3.6 |
| S03 | Independence of crystalline tensors from a lift | missing | Proposition 1.3.7 |
| S04 | Gauss-Manin transport in the formal neighborhood | missing | Proof of Proposition 1.3.7; BO83 §2.9 |
| S05 | Newton class of a mod-p point | missing | §1.3.8 |
| S06 | Admissibility of the point's Newton class | missing | Lemma 1.3.9; Wintenberger97 §4.5.3 corollary |
| S07 | Nonemptiness by special-point reduction | missing | Proposition 1.3.10; Introduction Theorem 1 |
| S08 | Integral zero-dimensional torus model | missing | Proof of Proposition 1.3.10 |
| S09 | Family isocrystal with G-structure | missing | §1.3.11; RR96 Definition 3.3 |
| S10 | Global crystalline tensor sections | missing | Proposition 1.3.12 and Corollary A.7 |
| S11 | Tensor functor for the universal crystalline realization | missing | Corollary 1.3.13 |
| S12 | Closed lower Newton locus | missing | Theorem 1.3.14.1; RR96 Theorem 3.6 |
| S13 | Nonempty locally closed Newton strata | missing | Theorem 1.3.14.2 |
| S14 | Newton closure inclusion | missing | Theorem 1.3.14.3; Introduction Theorem 2 |
| S15 | Mu-ordinary locus with existence gate | missing | §1.3.15 |
| S16 | Openness and nonemptiness of the mu-ordinary stratum | missing | §1.3.15 |
| S17 | Density under local integrality | missing | Corollary 1.3.16; Introduction Theorem 3 |
| S18 | Hyperspecial density specialization | missing | Remark 1.3.17; Kisin10 main theorem; Wortmann13 |
| S19 | Tame special-parahoric density specialization | missing | Corollary 1.3.18 |
| S20 | Prime-to-p integral tower | missing | §§2.1.1–2.1.2 |
| S21 | Extension of prime-to-p tensor sections | missing | §2.1.2 |
| T01 | Rational quasi-endomorphism group | missing | §2.1.3 |
| T02 | Polarization similitude character | missing | §2.1.3 |
| T03 | Global tensor-preserving quasi-isogeny group | missing | §2.1.3 |
| T04 | Compact-mod-scalars structure | missing | §2.1.3 |
| T05 | Prime-to-p integral automorphism subgroup | missing | §§2.1.3–2.1.4 |
| T06 | Hecke orbit injects into the quasi-isogeny quotient relation | missing | Lemma 2.1.4 |
| T07 | Frobenius quasi-isogeny and compatible powers | missing | §2.1.5 |
| T08 | Stable ell-adic Frobenius centralizer | missing | §2.1.5 |
| T09 | Split auxiliary-prime comparison | missing | Proposition 2.1.6 |
| T10 | Finiteness-to-group comparison argument | missing | Proof of Proposition 2.1.6; Kisin17 §2.1.7 |
| T11 | Finite-field crystalline descent and Frobenius norm | missing | §2.1.7, equation (2.1.7.2) |
| T12 | Crystalline stable centralizer | missing | §§2.1.7–2.1.8 |
| T13 | Semisimple conjugacy quotient | missing | §2.1.8 |
| T14 | Type-D adjusted conjugacy quotient | missing | §2.1.8 |
| T15 | Noot independence of Frobenius conjugacy class | missing | Corollary 2.1.9 proof; Noot09 Theorems 1.8,4.2 |
| T16 | Tate theorem for automorphisms with tensors at every prime | missing | Corollary 2.1.9; Introduction Theorem 6 |
| T17 | Common weight of a Weil quasi-endomorphism | missing | Lemma 2.2.5 |
| T18 | Admissible classical representation for Noot's argument | missing | §2.2.6 |
| T19 | Accommodating symplectic embedding | missing | §2.2.6 |
| T20 | Conjugacy independence for neat Weil points | missing | Proposition 2.2.2 |
| T21 | Accommodating-case character-polynomial argument | missing | §2.2.7 first paragraph; Noot06 §6.13; Noot09 Lemmas 2.5–2.6 |
| T22 | Auxiliary accommodating Shimura correspondence | missing | §2.2.7, pp.27–28 |
| T23 | Rational abelian-quotient map | missing | Lemma 2.2.8 |
| T24 | Conjugacy of realization embeddings | missing | Proposition 2.2.13 |
| T25 | Rational transfer of a maximal isogeny torus | missing | Corollary 2.2.14 |
| T26 | Rational isogeny Isom scheme | missing | §§2.3.1–2.3.2 |
| T27 | Classical Tate isogeny comparison | missing | §2.3.2; Tate66 and crystalline analogue |
| T28 | Tensor-preserving isogeny torsors | missing | §2.3.3 |
| T29 | Tate-with-tensors comparison hypothesis | missing | Conjecture 2.3.4 |
| T30 | Independence from a generating tensor family | missing | Lemma 2.3.5 first assertion |
| T31 | Tate-with-tensors for PEL A and C | missing | Lemma 2.3.5 second assertion |
| T32 | Geometric versus rational coefficient isogeny | missing | §2.3.6 |
| T33 | CM lift with respect to a maximal torus | missing | §2.3.7 |
| T34 | Special-torus Frobenius is a prime-unit | missing | Lemma 2.3.10.1–2 |
| T35 | Uniqueness of special torus Frobenius up to finite order | missing | Last assertion of Lemma 2.3.10 |
| T36 | Conditional geometric CM lift | missing | Proposition 2.3.11 |
| T37 | Torus reduction of the isogeny torsor | missing | Lemma 2.3.13 |
| T38 | Rational CM lift from a Hasse principle | missing | Corollary 2.3.14 |
| T39 | PEL geometric CM lifts | missing | Corollary 2.3.15 first assertion; Introduction Theorem 4 |
| T40 | PEL rational CM lifts in the stated cases | missing | Corollary 2.3.15 second assertion; Introduction Theorem 5 |
| T41 | Type-D disconnected-group variant | missing | §§2.3.6,2.3.16(2) |
| T42 | Unpolarized isogeny torsors split | missing | Remark 2.3.16(3) |
| A01 | Formal logarithmic scheme over Witt vectors | missing | Appendix A.1 |
| A02 | Log enlargement | missing | Appendix A.1 |
| A03 | Convergent logarithmic F-isocrystal | missing | Appendix A.1 |
| A04 | Enlargement comparison | missing | Appendix A.1, citing Ogus84 §2.7 and Ogus95 §3 |
| A05 | Log Dieudonne crystal | missing | Appendix A.1, MP19 §1.3.3 |
| A06 | Log Dieudonne rationalization | missing | Appendix A.1, Ogus84 §2.18; Ogus95 Remark 16 |
| A07 | Semi-abelian logarithmic realization | missing | Appendix A.2; MP19 §1.3.5 |
| A08 | Vertical and horizontal log comparison | missing | Appendix A.3 |
| A09 | Association of etale and logarithmic crystalline coefficients | missing | Lemma A.4; Faltings02 p.258; Faltings99 §6 |
| A10 | Crystalline value of an etale tensor at an integral point | missing | Appendix A.5 |
| A11 | Eisenstein divided-power enlargement system | missing | Proof of Proposition A.6 |
| A12 | Semistable chart and horizontal enlargement | missing | Proof of Proposition A.6 |
| A13 | Faltings invariant horizontal tensor lift | missing | Proposition A.6 proof; Faltings02 §5 Corollary 4 and Remark 1 |
| A14 | Proper semistable extension of tensor sections | missing | Proposition A.6 |
| A15 | Semistable alteration hypercover | missing | Corollary A.7 proof; de Jong96 Theorem 6.5; Ogus84 Theorems 4.6,4.1 |
| A16 | Unique global convergent tensor extension | missing | Corollary A.7 |
| L16 | Finite free cocharacter lattice | library | §1.1.1 |
| L17 | Galois invariance of the pairing | library | §1.1.1 |
| P15 | Semisimple rational endomorphism algebra | planned | §2.1.3 |
| P16 | Rosati positivity | planned | §2.1.3 |
| G21 | Compact real polarization-isometry group | missing | §2.1.3 |
| G22 | Hasse principle for simply connected semisimple groups | missing | Proof of Proposition 1.2.5, p.15 |
| G23 | PEL abelian quotient Hasse cases | planned | Corollary 2.3.15; Remark 2.3.16(1), Kottwitz92 §7, Shin11 Lemma 3.1.1 |
| G24 | Odd-degree unitary Hasse case | missing | Corollary 2.3.15; Remark 2.3.16(1), Kottwitz92 §7, Shin11 Lemma 3.1.1 |
| T43 | Odd-degree unitary rational CM lifts | missing | Remark 2.3.16(1) |
| T44 | Special-torus Frobenius Kottwitz formula | missing | Lemma 2.3.10.1–2 |
| A17 | Proper descent for convergent isocrystals | missing | Corollary A.7 proof; de Jong96 Theorem 6.5; Ogus84 Theorems 4.6,4.1 |
| A18 | Detection of convergent morphisms at fibers | missing | Corollary A.7 proof; de Jong96 Theorem 6.5; Ogus84 Theorems 4.6,4.1 |

## Continuation: N29 corrected and T23 proved (Claude Code, cc-fb70e5, 22 September 2026)

**N29, Corollary 1.1.15.** The printed conclusion w∈N_G(M)/M is false: the GL₃ example is kept, and is recorded as errata E2. The item now states the corrected result: w lies in the absolute Weyl group W(G,T) of a maximal torus T⊂M, equivalently some G(Q̄_p)-conjugate of μ factoring through T makes ([b_M],{μ′}) M-admissible. Its proof follows the paper's:
- transport to the quasi-split inner form, where G*-admissibility of ([b_{M*}],{μ*}) holds by Kottwitz functoriality and [Kot97, 4.4];
- apply Proposition 1.1.13 (N27), whose output is w*∈W(G*,T*) and not N_{G*}(M*)/M*;
- transport back, using that for basic b_M, M-admissibility is κ_M-equality (Lemma 1.1.6).

This is exactly what Corollary 1.1.17 (N32) uses: its proof writes "w∈W(G,T)". The G-source gate on N29 and N32 is resolved; G-local remains, for N27's cited unramified input.

**T23, Lemma 2.2.8.** The auxiliary group must be G′=G×_{G^ab}T, not the printed G×T. The printed version fails for two reasons:
- G×T is not contained in GSp(V⊕V,ψ⊕ψ);
- the kernel of I_{s′₀}→I_{s₀} contains 1×T, which maps onto G^ab (errata E5).

With the fibre product both problems disappear. G′ lies in GSp, and X×{h_T} maps into it because h^ab is constant on X. The kernel of the projection lies in T∩G^der, which dies in G^ab. So the restriction to A_T, composed with T→G^ab, factors through I_{s₀} by Corollary 2.1.9, and agrees with the i_ℓ-induced maps because g and t have the same image in G^ab. G-noot remains, for Noot's inputs and Corollary 2.1.9.
