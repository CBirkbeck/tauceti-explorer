# Red team: PAPER-CASTELLA-ETAL-22

Codex, session `codex-rtOQ9t`, 1 October 2026. Issue [#4168](https://github.com/CBirkbeck/tauceti-explorer/issues/4168). **Complete: four findings, two high and two medium.** The evidence and actionable corrections are in the [result](RT-PAPER-CASTELLA-ETAL-22.result.json).

The extraction and its review were performed by Claude Code sessions `cc-39fac3` and `cc-442dc5`, respectively. I did neither. This audit changes only its two deliverables, leaving the accepted extraction for the independent verifier and subsequent fix job.

## Scope and versions

I read the complete [arXiv v2](https://arxiv.org/pdf/2008.02571v2) through its 2,671-line TeX source and 309-line bibliography, alongside all 39 extraction items, 41 recorded source issues, nine routes, prerequisites, extraction report and independent review. The new statement findings were checked against the page images and the corresponding passages in the [author copy](https://web.math.ucsb.edu/~castella/Eisenstein.pdf).

The journal PDF request returned an HTML article page. Accordingly, the source criticisms below concern arXiv v2 and the inspected author copy. They do **not** assert that the version of record contains the same defects. URLs, access date and file hashes are recorded in `sourceVersions`. The [arXiv history](https://arxiv.org/abs/2008.02571) ends at v2, and the [author's publication list](https://web.math.ucsb.edu/~castella/) links no correction for this paper. Crossref supplied no correction/update relation. This search found no existing correction to the two specific statements; it is not proof that none exists.

The baseline atlas commit is `511d66e7e3d4032b41deb71cb5ce5f3a1ff4f7d3`. I read the cited layer descriptions and reviewed coverage records, including the distinction between abstract descent, arithmetic Heegner inputs, Eisenstein main-conjecture proofs and their downstream reexports. The two Part II routes coalesce with existing candidates. This audit requests no new roadmap.

## 1. The unit quotient in finite–singular comparison — high

**Location:** extraction item 17; arXiv v2 §3.1, p.16, equation (3.1).

The extracted generic comparison permits

\[
K=\mathbf Q(\sqrt{-3}),\quad p=3,\quad \ell=2,\quad
R=\mathbf Z_3,\quad T=\mathbf Z_3
\]

with trivial Galois action. The prime 2 is inert because the minimal polynomial of a primitive cube root of unity is irreducible modulo 2. Thus the auxiliary-prime conditions hold, and the smallest ideal in the definition is \(I_2=(3)\).

Here is the missing arithmetic. Reduction sends the cube roots of unity onto the group \(\mathbf F_4^\times\). The ring-class exact sequence quotients the residue-unit group by this image of global units, so

\[
G_2=\operatorname{Gal}(K[2]/K[1])=0.
\]

An independent small check enumerated all reduced primitive positive definite forms. Discriminant −3 has only \((1,1,1)\); discriminant −12 has only \((1,0,3)\). These give the same trivial relative ring-class group. The enumeration uses \(|b|\le a\le c\), \(b^2-4ac=D\), primitivity, and the usual nonnegative boundary representative; the reduction bound makes it exhaustive.

On the other hand,

\[
H^1_f(K_\lambda,\mathbf F_3)
=\operatorname{Hom}_{\mathrm{cts}}(\widehat{\mathbf Z},\mathbf F_3)
\cong\mathbf F_3,
\qquad
H^1_s(K_\lambda,\mathbf F_3)\otimes G_2=0.
\]

Therefore the extracted isomorphism cannot exist. The preceding source argument identifies the residue quotient with the ring-class group without retaining the unit contribution.

**Repair:** retain the general Selmer-structure definition, but add the required prime-to-\(p\) unit-image hypothesis to its ring-class comparison. The uniform sufficient condition \(p\nmid\#\mathcal O_K^\times\) is convenient. Explain how §3.2's odd-prime and \(p\nmid D_K\) assumptions discharge it in the actual application. Record the source restriction and versions rather than silently narrowing the imported statement. ES.1 remains the abstract owner and HE.5 the arithmetic consumer.

This counterexample does not challenge the principal Eisenstein theorems: their field/prime restrictions exclude it. Its significance is that item 17 exports the comparison as a reusable generic statement.

## 2. The zero-module branch in the finite-module lemma — high

**Location:** item 22; §3.3.2, pp.22–23, Proposition 3.3.11(i).

Take any DVR \(R\) in the stated setting and set

\[
M=M'=X=0,\quad k=1,\quad a=a'=b=b'=0.
\]

Both exact sequences reduce to the identity sequence

\[
0\longrightarrow0\longrightarrow R/\mathfrak m
\xrightarrow{\mathrm{id}}R/\mathfrak m\longrightarrow0.
\]

The source defines the exponent using nonnegative annihilating powers, so \(\exp(0)=0\). Thus every numerical condition is satisfied. Both modules are doubled modules, yet \(s=s'=0\). The required choice of an index in \(\{1,\ldots,2s\}\) is impossible.

**Repair:** state the omitted-summand conclusion under \(s>0\), and supply the empty-case injection \(0\hookrightarrow X\) separately. Record the source issue with its inspected versions. The later application explicitly handles \(s=0\) before its induction, so the main bound is not contradicted. The correction belongs in the item routed to ES.4; it does not require rebuilding finite-module theory.

## 3. Extract the local measure constructions — medium

**Location:** §2.1, proof of Theorem 2.1.1, pp.12–13, equations (2.2)–(2.3); items 13 and 15.

The packet has the BDP interpolation statement and a narrative reference to its construction. It lacks defining items for the local Serre–Tate measure, the Atkin–Serre operator/p-depletion, and the resulting measure on the units. These constructions are explicitly used to transfer congruences of expansions to congruences of measures. They need their own statements and statuses under PROTOCOL §16.

The fix should identify the coefficient ring and CM point, give the binomial-moment characterization, specify the operator's action, and retain the support assertion. This is finite extraction work, not a request to decompose every theorem of Castella–Hsieh or to provide blueprint APIs and tests.

Existing ownership supplies the route:

| Content | Existing supplier or owner |
| --- | --- |
| p-adic modular-form space and ordinary expansion input | PadicFamilies L0; source-specific CM operators/comparisons in AutomorphicPadicLFunctions L3 |
| Coefficient-general bounded-measure construction and restriction to units | PadicMeasuresIwasawaAlgebras L2 |
| BDP-specific local measures and assembly | GrossZagierAndArithmeticHeights GZ.9 |

At the pinned Mathlib commit, `PadicInt.hasSum_mahler` and `PadicInt.mahlerEquiv` provide the general complete ultrametric Mahler substrate. `AbstractMeasure.amiceTransform` and its injectivity allow general coefficients, but `amiceTransformEquiv` is specialized to \(\mathbf Z_p\)-valued measures. It must not be cited as a ready-made inverse equivalence over the paper's completed unramified coefficient ring. The existing partial PadicMeasures packet already includes `L2/bounded-inverse-amice` and unit-restriction nodes; import their contract without treating pending work as formalized.

Likewise, accepted RS-14 gives IG.1 a precise special-fiber Igusa contract and leaves source-specific mixed-characteristic comparisons with their consumers. Adding extraction items is no reason to create a second general Igusa roadmap.

## 4. Apply the already confirmed Euler-sum correction — medium

**Location:** item 11 and source issue E18.

E18 is independently confirmed and gives the correct finite index set

\[
S=\Sigma\setminus\{v,\bar v,\infty\}.
\]

Item 11 still sums over every place in \(\Sigma\) not above \(p\), which includes infinity. The local Euler polynomial appearing there has no archimedean definition. This is a mismatch inside the accepted deliverable, independently of any dispute about the source.

**Repair:** use \(w\in S\), state the definition of \(S\), and refer to E18. Preserve that existing issue instead of creating another. Update the report's correction list. This implements PROTOCOL §18's requirement that extracted statements contain the recorded corrections.

## Other checks and limits

The sole library status, Weierstrass preparation, has a real pinned supplier: I read `PowerSeries.exists_isWeierstrassFactorization`, its nonzero-residue hypothesis and uniqueness, together with `Polynomial.IsDistinguishedAt`. I also read the pinned Mahler/Amice signatures above and searched the pinned Tau Ceti tree for the source-specific machinery. The reviewed coverage correctly distinguishes explicit 2-descent Selmer groups from general Galois-cohomological Selmer structures.

I checked the nine routing decisions against the stage descriptions and existing import boundaries. This found no additional evidenced duplication or route error. I reviewed all prior source issues, including their impact on the main-theorem hypotheses, but did not independently rerun every earlier PARI elliptic-curve example. Suspicions lacking a decisive source comparison or counterexample have not been promoted to findings.

Validation: `scripts/check_redteam.py`, the intake deliverable check, and the staged whitespace check. No Lean file is requested or changed, and no Lean compilation, library build, cache fetch or language server was run.
