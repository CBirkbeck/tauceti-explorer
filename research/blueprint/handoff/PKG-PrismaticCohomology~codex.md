# PKG-PrismaticCohomology~codex — completed package

Issue: #10016. Agent: Codex, session `codex-2fDWWk`, 2026-10-16.
Branch: `codex-2fDWWk-prismatic-package`.

**Status: complete packaging submission, for independent review.** This
continues the mathematical checkpoint in draft PR #9948, at commit
`ed1ac274c9c2b9bec5b2b050e149315099d0d27b`. The two outstanding questions
have been resolved: §1.24 gives the valid theorem with its necessary
completion hypothesis and an explicit counterexample to the unrestricted
claim; §§8.76a–8.77 give the common log PD deformation, rational rigidity
and nonzero-parameter comparison. No unfinished proof is being submitted
as a completed theorem by reference to the checkpoint.

The deliverable is a roadmap, not a formalisation. Its constructions and
proof outlines still require Tau Ceti implementation and the ordinary
independent package review. In particular, the new counterexample and
fs-monoid rigidity argument should receive mathematical review; neither
is claimed to be a published theorem or proved by the Lean build.

Only the package README and Suggested.lean and this handoff were changed.
The existing metadata remains `topic = "math.AG"`. Packets, readers,
independent reviews and `review.json` were not edited. The later
2026-10-12 shape rule in PACKAGE_REVIEW.md and PROTOCOL §20 supersedes
the issue's older 50–200 KB limit: all target detail, hypotheses, APIs
and Checks remain in the README. Suggested.lean is 468 lines.

## What the two resolutions establish

### Syntomic p-torsion control, §1.24

The unqualified assertion for every p-torsion-free bounded prism is false.
It is not enough to repair the argument by appealing to bounded p-torsion
of A/I. The retained positive assertion assumes bounded I-power torsion
of A/p, equivalently the pro-zero condition on ((A/I^n)[p]). It includes
crystalline, transversal, perfect and noetherian bases. In particular it
includes the perfect A_inf bases used by the downstream applications.

The proof applies complete flatness over the correct ideal, then uses
the one-element bounded-torsion argument to show that reduction modulo p
is discrete. Its degree minus one cohomology is the p-torsion of the
complete-flat algebra. A Čech equaliser then proves the H⁰ assertion.
Sources actually read: ALB23 Lemma 5.1.6, p.76; BS22 Lemma 3.7 and
Proposition 3.13, pp.30–35; BMS2 Lemmas 4.6–4.7, pp.18–19.

The negative control is now a counterexample to the theorem itself,
stronger than the checkpoint's failure of a proposed proof shortcut.
Let J_n=(p,d^n) in Z_p[[d]] and M=product J_n. Give M the continuous
right shift t with (tm)_1=0 and (tm)_(n+1)=d m_n. Over the
(p,d)-completed polynomial ring T in d,t, take A=T plus the square-zero
module M, with Frobenius zero on M, d mapping to d^p+p and t to t^p.
The README verifies derived completeness, regularity of p,d,
distinguishedness of d, and the uniform p-torsion bound in A/d.

The class e_n represented by p in component n survives after inverting t.
In R=A[1/t], the classes z_n=t^(1-n)e_n satisfy d^n z_n=0 and
d z_(n+1)=z_n, with z_1 nonzero. Thus the completed localisation
B=LΛ_(p,d)R has B[p]=lim (R/p)[d^n] nonzero. It is a discrete bounded
prism by complete flatness. Its quotient S=B/d is p-completely étale
over A/d. The universal property of inverting t makes B initial among
prisms over S; hence H⁰((S/A)_Δ,O_Δ)=B. All of these steps, including
the nonzero transition rather than merely unbounded torsion, are written
in §1.24. This construction is attributed to the argument in the package,
not to ALB23. The unrestricted ALB23 formulation must not be restored.

### Proper log Cartier comparison, §§8.76a–8.77

The comparison is retained for the fs charts of KY §8, including nonfree
sharp monoids and parameters with nonzero theta image. It is not reduced
to the standard one-parameter semistable-DVR case.

For sharp fs P, §8.76a constructs the p-torsion-free augmented PD monoid
base D(P) inside W(k)[P][1/p], followed by p-completion. Its augmentation
ideal J satisfies phi^n(J) contained in p^e(n) J, where
e(n)=(p^n-1)/(p-1). The factorial computation is given on every divided
monomial; a positive monoid height bounds denominators in each degree.
The construction retains the relations of P.

For a derived p-complete D-complex C with a uniform Frobenius isogeny
bound and perfect Witt fibre C_0, the section problem is controlled by
the p-complete mapping complex into J tensor C. Frobenius contraction
dominates the linear isogeny denominators, including on higher homotopies.
The README supplies the further effectivity argument: clear a fixed
denominator, form the integral cone, factor a p-power of its identity
through J, and use the factorial bound to kill the cone after inverting p.
The argument does not assume C is D-perfect, D noetherian, or Frobenius
flat. It does not infer effectivity from contraction alone.

The proper Cartier log crystalline complex is constructed over this base.
Kato Theorem 6.10, p.222, supplies derived PD base change; Hyodo–Kato
§§2.22–2.24, pp.239–242, supply the uniform Cartier Frobenius bound.
Proper coherent cohomology and p-completeness make the Witt fibre perfect.
These source passages were read, including the scanned Kato pages.
Colmez–Nizioł Lemma 2.4 and Theorem 2.6, pp.11–13, motivate contraction;
their one-parameter result is not cited as an arbitrary-fs theorem.

Section 8.77 chooses a rank-one chart in the sense delta_log=0, using
KY Proposition 2.39, p.21, and records the unit factors on changing
charts. Finite presentation and finite charts allow one Frobenius iterate
to kill the finitely many nilpotent coefficient differences from the
special fibre. The resulting positive parameters lie in
ker(A_crys to O_C/p), even when their theta images are nonzero. The
evaluation D(P) to A_crys is therefore a valid PD chart map. The scalar
comparison follows from rigidity and PD base change. Frobenius removes
the chosen iterate; uniqueness gives compatibility with further iterates
and with presentations of the same chosen augmented chart.

The claim is an existence comparison with its stated choices, not an
unspecified invariance under unrelated charts or period parameters. No
map from the zero Witt chart to a nonzero A_crys parameter is inserted.
The one-parameter, p=2, two-parameter, nonfree monoid, zero-complex and
nonzero-theta controls are in the README. Representative elementary
controls also appear in Suggested.lean.

## Completion of the supplementary assembly targets

The main packet has seven nodes in addition to the 369 accepted-part
nodes. Their APIs were read individually and reconciled by mathematics,
not just by matching their names. The main packet remains `partial` with
its inherited `needs_changes` review, since this issue does not edit
packets or issue an independent review of them.

| Assembly node | Completed package interface |
| --- | --- |
| PR.5/quasi-coherent-complexes-on-prestacks | §4.0: pointwise infinity-category limit, evaluation and pullback coherences, affine identification, colimit-to-limit property, pointwise Perf/Pic and size control. All eleven API roles and five Checks are covered. |
| PR.5/flat-descent-for-quasi-coherent-complexes | §4.0: faithfully flat descent for unbounded complexes through flat module descent, bounded-below complexes and left-complete Postnikov limits; sheafification and Čech equivalences. |
| PR.5/affine-direct-image-and-base-change | §4.0: restriction-of-scalars adjunction, derived-cartesian base change, projection formula and global sections; formal completed versions specify the ideals and completed tensor. §4.9 distinguishes flat-prism and arbitrary-prism ranges. |
| PR.6/framed-q-automorphisms | §5.0: complete étale delta-base framing, coordinate regularity, construction and uniqueness of commuting q-automorphisms and their functoriality. The complete-étale hypotheses replace an unjustified ordinary lifting assertion. |
| PR.6/q-derivations-and-their-koszul-complex | §§5.0 and 5.15–5.16: difference divisibility, coordinate q-Leibniz operators, commuting cochain model and finite delta derivative thickening. Operators on an envelope are constructed even if a coordinate is a zero divisor. |
| PR.7/beilinson-fibre-square-input | §7.0: absolute trace identification, relative linear HH/HC/HC-minus/HP, rational TC square, motivic graded calculation and the uncompleted syntomic Beilinson square. §6.31 states the continuity range used for extension. |
| PR.7/fargues-fontaine-slope-zero-input | §7.0: schematic/adic curve, Robba-window dictionary, GAGA, filtered-isocrystal modification and degree, weak admissibility to slope zero, then classification on the algebraically closed tilt. §§7.17 and 7.20 use the constructed dictionary. |

Names abbreviated inside a declared API namespace in the README represent
the corresponding full assembly names. This affects literal name counts
for the QCoh and framing nodes, not their statements or coverage.

The trace construction imports AInfCohomology AI.7.2 and AI.7.3, which
already own the relevant THH operations and relative TP comparison. It
does not rebuild those inputs. Its new targets are the absolute
identification, linear trace square, graded comparison and filtered-bundle
dictionary in the ranges the suppliers do not already state.

## Whole-package adversarial mathematics pass

I read the entire mathematical payload: the 369 retained accepted targets,
the additional local foundation subsections and all supplier contracts.
The table records families together to keep the handoff usable; the
number ranges include the intervening definitions, identities and API
claims. Checking an explicit prerequisite graph or a Lean elaboration
was not substituted for this mathematical pass.

| Statements checked | Instances and failure modes tried | Result or correction |
| --- | --- | --- |
| Conventions and §§0.1–0.21 | Zero ring; F_2; p=2,3; square-zero multiplication; same Frobenius with different delta | Retained integral coefficients and negative addition correction. Frobenius congruence is not delta data. Lean gives C_2(1,1)=-1, C_3(1,2)=-6. |
| §§0.22–0.46 | Zero denominator set after localisation; p-torsion; radical versus nonradical targets; finitely generated versus arbitrary completion ideals | Retained exact localisation universal properties and one-step loss in the delta modulus. No cancellation of p or arbitrary-ideal completeness is used. |
| §§0.47–0.60 | Bottom/unit ideal; ideal (p); étale F_p algebra; zero input; Witt cofree adjunction triangles | Delta closure is generated by delta iterates, not Frobenius iterates. Étale delta lifting uses the Witt square and étale lifting along a surjection. Cofree constructions include integral operations and both triangles. |
| §§0.61–0.82 | Distinguished p versus p²; unit and zero; perfect characteristic-p reduction; crystalline and q=1 prisms | Distinguished means delta is a unit; the unit element is not distinguished in a nonzero ring. Boundedness and regularity are kept separate. |
| §0.83 | Raw Frobenius colimit with a square-zero module; d=u-p; actual nonzero surviving class | Specified the semilinear shift Frobenius completely. The raw colimit can have a zero divisor; the completed perfection is the prism. |
| §§0.84–0.92 | Zero/regular relation; p=2; ordinary versus completed envelopes; unbounded torsion | Ordinary delta envelopes use delta closure and alternating torsion removal. Removed an unsupported identification of the ordinary initial object with its derived completion. |
| §§1.0–1.13 | Zero site object and empty cover; affine line; weak initial ring versus site orientation; Bockstein degree one at p=2 | Formal-site and quasisyntomic restriction ranges are stated. Čech direction and beta(f)²=0 are retained without using odd-p antisymmetry. |
| §§1.14–1.23 | Crystalline prism; smooth polynomial algebra; proper point versus nonproper affine; Frobenius-twisted de Rham base change | Hypotheses distinguish the original Witt-torsion-free comparison from the later all-bounded-prism comparison. Properness is needed for perfectness. |
| §§1.24–1.27 | Perfect A_inf, crystalline and zero bases; square-zero completed localisation; p-completely étale S | Corrected the false unrestricted p-torsion theorem and supplied the nonzero inverse-limit counterexample described above. |
| §§2.0–2.6 | Singular animated algebra; affine versus global obstruction; p-torsion base; derived reduction modulo p^n | The constant presentation comparison is not singular site equality. Formal deformation uses the completed cotangent complex and derived reductions, avoiding an underived kernel identity. |
| §§2.7–2.18 | Zero relation in a derived self-intersection; crystalline PD polynomial; infinite QRSP presentation | Retained the checkpoint's corrected distinction between nondiscrete derived reduction and possibly discrete unreduced cohomology. Added the infinite-cotangent negative control to a finite perfectoid regular presentation. Initial rings give final site objects. |
| §§2.19–2.29 | Characteristic p; p-torsion semiperfectoid quotient; rank 0/1 adic projectives; compatible versus single quotient lift | Perfectoidisation reduction is an algebra in D(A/I), with an animated identification only in its discrete range. Tower effectivity is additional to the existing single-quotient lifting theorems. |
| §§2.30–2.31 | Perfect prism base change; arc valuation tests; trivial group; arbitrary G action versus a torsor outside V(J) | Clarified that the finite-group quotient assertion requires the torsor condition outside V(J). Arbitrary finite actions do not suffice. |
| §§3.0–3.11 | Unit and zero complexes; first two Nygaard stages; crystalline/q=1 specialisation; orientation rescaling | Kept filtered direction, Breuil–Kisin twists and divided Frobenius. The relative filtration is on the Frobenius pullback. |
| §§3.12–3.26 | Non-Nygaard-complete QRSP; i=0,1,2; p=2; convergence in two topologies | Replaced the false one-step delta estimate by the mixed-topology estimate of BS22 Lemma 13.2; the dyadic squared class is a negative control. |
| §§4.0–4.10 | Spec(Z); B(Z/2) over F_2; Z to F_p; nonflat derived self-intersection; completion | Pointwise QCoh is an infinity-category limit. Flat affine base change is proved in its actual range; ordinary Cartesian squares require Tor independence. Arbitrary prism pushforward is not asserted to have unrestricted base change. |
| §§4.11–4.21 | Unit/twisted Sen object; characteristic-p algebra; ordinary versus animated prism object; all-prism comparison | Kept the nilpotence restriction in the Sen essential image. The relative site uses ordinary objects of the appropriate derived construction, not a nonexistent animated site equality. |
| §§4.22–4.31 | F_p, Z_p, W(k); weights 0,1; m=n=1 and m=2,n=1; divided Frobenius 6 to 3 at p=2 | Verified the inherited correction of the printed filtered index to m-n. Added a computed witness in README and Lean; m+n would add an extra p². |
| §§5.0–5.14 | q=1; zero coordinates; p=2; polynomial versus toric chart; completed infinite coordinate set | Complete étale framing and tX_i regularity replace the incorrect inference from flatness over the coefficient ring alone. Divide the first-order difference before setting t=0. Infinite-coordinate operators use completed finite pieces and summability. |
| §§5.15–5.17 | A coordinate zero divisor in an envelope; dyadic square; J=tP; zero/unit relation; mixed two-coordinate operator | Constructed the finite free epsilon thickening and its delta/q-PD ideal. The derivative is its epsilon coefficient. Quotient notation is used only where the denominator is regular; Frobenius compatibility does not cancel X_i. |
| §§5.18–5.26 | Two ordered coordinates; reversed orientation; coordinate union/repetition; q=1 and theta versus theta-tilde | Checked the inherited skew multiplication, semicosimplicial comparison, ordered merge homotopies and finite indexed unit-family construction. They are explicit E_1/coherent targets rather than an unsupported canonical multiplicative isomorphism. |
| §§6.0–6.0b | Singular affine ring; bounded/nonbounded formal scheme; valuation and untilt charts; finite-level Z/p^n | The formal-v and Spec/Spa adapters give the bounded pre-adic range. The arbitrary affine/formal-sheaf comparison is kept separately. No false general p-torsion lemma is used in valuation arguments. |
| §§6.1–6.14 | Zero ring; p inverted; perfect F_p; n=0,1 and negative weight; Artin–Schreier sign | Derived fixed points are fibres. Perfectoid principal comparison allows the zero ring and zero divisors. Both signs of can-minus-phi differ by the specified minus-one fibre adapter. |
| §§6.15–6.33 | F_p, O_C, formal torus; finite coefficient levels; varying weights; unbounded towers | Corrected scope of pre-adic nearby cycles in §§6.4–6.5 and 6.25. Continuity uses a fixed weight/range bound, not an exchange of rationalisation with an arbitrary totalisation. |
| §7.0 trace foundations | R=Z and F_p; degree 0 and -1 TC; norm cofibres; qsyn QRSP descent | Linear HH is relative over HZ and is obtained from THH through THH(Z), not by tensoring over the sphere. HC-minus to HP over F_p is a rational equivalence, not two zero terms. The norm cofibres have the stated shifts. |
| §7.0 Beilinson square | n=0,1; O_C Kummer class; completed versus uncompleted syntomic complex | Supplied the rational TC square and the motivic graded calculation with uniform denominators. The uncompleted extension and nonzero scalar are justified; neither rationalising a totalisation nor the desired fundamental sequence is assumed. |
| §§7.0,7.17,7.20 curve dictionary | Rank 0; phi=p with filtration jump 1 versus 0; degree +1/-1 sum; zero Frobenius; algebraically closed tilt | Degree is t_H-t_N. Slope-zero classification follows weak admissibility plus the curve theorem, not the desired crystalline equivalence. GAGA is part of the analytic/schematic adapter. A degree-zero unstable bundle is not declared trivial. |
| §§7.0a–7.0b | Arbitrary perfect residue field versus finite residue; trivial Galois action; completed Galois products | The perfect-residue period invariants and full-faithfulness target supplies the extra range missing from the finite-Q_p supplier. Almost-product sections are passed through Witt completion before the Laurent comparison. |
| §§7.1–7.16 | Unit and rank-zero crystal; Laurent inversion at (p); O_C and O_K; integral versus rational coefficients | Site descent, Frobenius isogeny versus Laurent Frobenius isomorphism and the two theta conventions remain separate. Added the missing explicit formal-v prerequisites of §7.8. |
| §§7.18–7.26 | Rank-one Tate twist; effective Kisin module and dual; weights beyond [0,p-2]; mod-p full faithfulness | Retained the all-weight adapter and actual Tate twisting. The counterexample to mod-p full faithfulness is not used against the integral theorem. Corrected Theorem 7.9's proof page range to pp.31–32. |
| §§8.0–8.0d | Extension by zero; zero and two-term Frobenius complexes; strict square-zero log thickening; p-torsion base | Algebraic Witt–Frobenius Riemann–Hilbert is local and bounded. Formal chart and completed cotangent targets state their ranges; vanishing alone does not imply finite presentation. Big formal crystalline and finite-level small-site bases are distinguished. |
| §§8.1–8.17 | Unit monoid; p=2 logDelta(m)=1; trivial log; perfect p-divisible versus all-divisible monoid | Retained the p cross term and rank-one meaning. The Lean witnesses give logDelta(m²)=4 and unit factor 9. No all-integer divisibility is inferred from perfection. |
| §§8.18–8.35 | Log affine line; semistable xy=pi; zero relation; nontrivial log cotangent | Hodge–Tate and crystalline comparisons use the completed log cotangent complex. The corrected zero-log self-intersection test is retained. Finite-level crystalline calculations keep their actual PD base. |
| §§8.36–8.42 | q=1; p=2 and 2N in Z; coordinate merge; nonfree chart | Log q-de Rham uses free resolutions, exactification and derived totalisation, not an ambient coordinate assumed to exist. The generator Y in 2N has coefficient 1. Small crystalline reduction uses D/(q-1,p^m), not an unwarranted fixed p-adic scheme over every level. |
| §§8.43–8.58 | Infinite QRSP prelog algebra; trivial log; Frobenius twist; non-smooth ring chart | Removed process identifiers. Smoothness of the algebra chart over the base is required in §8.55; smoothness of the monoid map alone does not replace it. |
| §§8.59–8.70 | Rank 0/1 system; torsion versus finite-free coefficients; log disc; nonnoetherian perfectoid chart | The noetherian adic-site hypotheses do not silently restrict the separate perfectoid construction. Finite-free Z_p conventions and the completed/condensed untilt sheaves are explicit. |
| §§8.71–8.75 | Trivial log; p^a-root permutation system; prime-to-p n-root system; arithmetic unramified action | Freshly read the five-page KY corrigendum. Corrected essential image is p-Kummer; finite-level inertia is killed at depth v_p of the order of GL_r(Z/p^n). No one finite root depth is asserted to kill the entire integral system. Smooth proper pushforward is preserved. |
| §§8.76a–8.79 | p=2 factorials; P=0,N,N² and the nonfree saturated cone; zero complex; nonzero theta parameter; proper log point | New augmented PD base, uniform contraction, effectivity and evaluation close the nonzero-parameter comparison. Corrected the stale Proposition 8.4 pointer in the BKF application to KY Propositions 8.8–8.9 and §8.76a. |

## Sources and locator checks

All previously flagged mathematical ranges were reconsidered against
their supplier contracts and written arguments. In particular, the
checkpoint's §§5.18, 5.22 and 8.40 coherent constructions, §6.31
continuity argument and §8.0 bounded Riemann–Hilbert adapter were read
as constructions, not adopted as assertions proved by a name match.
The two blocked comparisons received the new arguments above.

The requested additional source sample was selected from the 389 numbered
subsections using `Random(20261016).sample(..., 15)` and then read in the
public originals. Source pagination is printed pagination unless the
README explicitly fixes an arXiv version. This table is a locator check,
not a claim to have reread every proof in every cited paper.

| Sampled subsection | Source and location read | Result |
| --- | --- | --- |
| 0.51 | BS22 Definition 2.1, p.13; Lemma 2.9 and Example 2.10, p.15 | Delta-kernel stability agrees with the polynomial axioms. |
| 0.69 | BS22 Lemma 2.38, p.24; Corollaries 2.39–2.40, p.25; Lemma 2.41, pp.25–26 | Regular PD/delta envelope comparison and hypotheses agree. |
| 0.90 | BS22 Lemma 2.12, p.16 | Faithfully flat free-delta Frobenius gives the fpqc statement. |
| 2.31 | BS22 Theorem 10.9, pp.80–81; Theorem 10.11 and Corollary 10.12, pp.82–83 | Clarified the finite-group torsor hypothesis. |
| 4.31 | BL22 §5.7, pp.144–147 | Verified the inherited m-n correction against the twist and graded-piece calculation. |
| 5.16 | BS22 Lemma 16.20 and its proof, pp.114–115 | The envelope derivative requires the additional noncancelling construction of §5.15. |
| 6.23 | BL22 §7.3, Proposition 7.3.1 through Remark 7.3.5, pp.175–177 | Weight-one fibre and Chern-class conventions agree. |
| 6.29 | BL22 §§8.3 and 8.5, pp.193–194,202–203; BM23 §1.1, p.2 | Comparison map and syntomic conventions agree; the finite-range continuity interface is explicit. |
| 7.4 | FCRYS Definition 4.1 and Example 4.3, p.12 | Integral coefficient and Frobenius isogeny conventions agree. |
| 7.11 | FCRYS Lemma 4.10, p.13, and Corollary 4.11, p.14 | QRSP evaluation and faithfulness range agree. |
| 7.24 | FCRYS Theorem 7.9 and proof, pp.31–32; Corollaries 7.10,7.12, p.33 | Extended the proof locator from p.31 to pp.31–32. |
| 8.32 | K1 Appendix B, Lemmas B.1,B.3, p.61, and Proposition B.4, pp.61–62 | Relative monoid Frobenius range agrees. |
| 8.41 | K1 Theorem 8.1 and Remark 8.3, p.45 | Semistable comparison and framing conventions agree. |
| 8.55 | KY Proposition 5.17, p.51, and Theorem 5.29, pp.55–56 | The complete smooth algebra chart hypothesis is now explicit. |
| 8.64 | KY Example 7.6, p.72, and footnote 5, p.3 | Generic-fibre log structure and chart convention agree. |

Additional substantial fresh readings included SAG pp.490–493,505–507
and HA Proposition 4.6.1.11, p.620, and Theorem 7.2.4.4, p.1263, for
the QCoh and perfect-complex interfaces; BMS2 §§5,7–9 and AMMN
Theorems 2.20,3.4,3.10 and §§6.16–6.21 with Appendix B for trace and
syntomic comparisons; and Fargues–Fontaine §§6.5,8.2,10.5,11.2–11.3
for the curve dictionary and slope-zero result. Their exact theorem and
page locators are in §7.0.

Fontaine's public period-theory chapters were read at II §1.5.7, p.74,
§2.3, pp.77–79, and Theorem 5.3.7, pp.100–101; III §§5.1–5.5,
pp.155–166. This checks the perfect-residue inputs of §7.0a without
borrowing weak-admissibility-implies-crystalline as an input to its own
proof. The cleared-source index was read and cleared files were used
only in place; no such files or passages are included in the submission.

The previously inaccessible KY corrigendum was successfully fetched from
the public author attachment on this run and read in full: Lemma 1,
pp.1–2; Definition 2 and Example 3, p.2; Definition 4, p.3;
Proposition 5, pp.3–4; Remark 6 and Theorem 7, p.4. Its introduction,
p.1, explicitly preserves the published Proposition 7.37. These match
the retained correction and the preprint/published numbering adapter.
It does not supply the separate argument of §8.77.

The five-page author PDF was fetched on 2026-10-16 from
<https://researchmap.jp/7000017226/misc/53305261/attachment_file.pdf>;
SHA-256:
`005ee338ad8f6cb0adb297dfadcb7bca06bea7e817e5b97dc09ac0e5ea686b1f`.
This identifies the copy whose numbering was checked; the PDF itself is
not included in the repository.

No source passages or section-by-section source summaries were added to
the repository. New mathematics is stated in the package's own words,
with the source's narrower range distinguished from the local extension.

## Libraries, ownership and duplication

The reviewed library audit has no PrismaticCohomology entry. Its related
Habiro and refined-trace entries were checked. The actual pinned
declarations behind all 144 front library-provision entries were read,
including the quotient-power transition, adic Cauchy-sequence constructor,
slice topology and prime-localisation declarations where name searches
had ambiguous hits. The ordinary syntomic API was also read. No missing
prismatic carrier was inferred from an existing ordinary name.

Pinned revisions used for elaboration and library checks:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The current upstream roadmap checkout and current Tau Ceti at `a91d3aaf`
were searched by mathematical objects, fields, operators and hypotheses.
The search included the nine later roadmap families named in WORKERS.md
and the four Completed roadmaps. Relevant hits were read; this is not a
claim to have audited every unrelated theorem of those roadmaps.

| Existing owner or construction | Package treatment |
| --- | --- |
| IntegralHeckeAndGaloisDeterminants §6.4 | Newly identified ordinary finite-sequence Koszul owner. Removed that ordinary construction from the DD.1 supplier request and imported the current roadmap. DD.1 retains the additional completed/derived adapters. |
| AlgebraicVectorBundles Layers 0A–0B | Retained import of monoidal sheaf foundations and affine vector bundles. Adic compatible-tower effectivity remains the distinct local target. |
| AdicSpaces Layer 6; current Tau Ceti Fargues–Fontaine windows and quotient topology | Retained the adic chart import. Existing radius bounds, windows, free Frobenius action and topological orbit quotient do not provide the schematic curve, quotient sheaf, GAGA or vector-bundle modification theorem. Those extra targets remain in §7.0. |
| Current Tau Ceti idempotent and projective lifting | Reused `TauCeti.IsAdicComplete.exists_isIdempotentElem_eq` and `TauCeti.exists_projective_quotient_smul_top_linearEquiv`, with the ambient-endomorphism completeness hypothesis of the latter. A single lift is not the compatible-tower effectivity theorem. |
| Mathlib divided powers, Witt vectors, localisations, condensed carriers and ordinary derived categories | Reused the actual carriers. There is no new ordinary divided power algebra, ordinary Witt-vector ring, ordinary localisation or duplicate condensed ring. The sheaf target uses `Condensed CommRingCat`, `CondensedSet` and `CondensedMod`. |
| AInfCohomology AI.7.2–AI.7.3 | Relative trace foundations and relative TP/prismatic comparison are imports. The local absolute/graded assembly is specified separately. |

No other current-upstream duplicate requiring deletion was found. No
upstream repository or library file was edited or built. The higher-tier
roadmaps are named only as downstream consumers, not as suppliers.

For downstream reconciliation, the local ownership moves retained from
the checkpoint are the bounded formal-site adapter, pre-adic/formal-v
comparison, perfect-site/arc and integral perfectoidisation adapter,
bounded algebraic Witt–Frobenius Riemann–Hilbert, perfect-residue period
adapter, all-weight Kisin adapter, formal log/PD adapters and
completed-untilt/condensed coefficient adapter. This run additionally
makes explicit the QCoh/formal completed descent construction, general
complete delta-base framing and envelope derivative, absolute graded
trace square, filtered Frobenius bundle dictionary, and augmented log PD
rigidity. Broader downstream roadmaps should import these targets rather
than plan them again. Ordinary Koszul complexes are the exception: their
owner is the current Integral Hecke roadmap, as above. No downstream
file was changed in this job.

## Suggested Lean signatures and validation

I read the full Suggested.lean with its variable blocks. The elementary
delta and log-delta structures deliberately make sense on arbitrary
commutative rings; the README explicitly separates them from the
p-local geometric theory. Heavy sites, stacks, period rings and completed
derived constructions stay in the README and the closing inventory.
There are no sorry-valued data definitions, fictional carriers or
conclusion-as-hypothesis placeholders.

The following ten signatures were checked directly against the README:

| Lean signature | README and generality check |
| --- | --- |
| `Delta.addCorrection` | §0.1: division occurs in natural coefficients before evaluation; prime is required for the mathematical coefficient identity. |
| `Delta.Structure` | §0.3: both additive and multiplicative polynomial laws, zero and one, over the fixed commutative ring. |
| `Delta.FrobeniusLift` | §0.4: an actual ring homomorphism with an existential congruence, without chosen division or a derived homotopy. |
| `Delta.associatedFrobenius_isLift` | §0.5: the function x^p+p delta(x) is promoted by an existence theorem, with p prime. |
| `Delta.reconstruction` | §0.6: injectivity of multiplication by p is explicit; characteristic zero alone is insufficient. |
| `Delta.integerDelta_structure` | §0.8: integer division and an existence theorem for a real-bodied structure; no sorry-valued carrier. |
| `Delta.quotient_structure_iff` | §0.9: quotient compatibility is exactly stability of the actual quotient kernel. |
| `Delta.idealClosure_prime` | §0.48: prime assumption is present; delta(p)=1-p^(p-1) forces the generated ideal to be the unit ideal. |
| `QCrys.qInteger_mul_sub_one` | §5.1 and conventions: finite geometric sum; includes n=0 and q=1 without a quotient by q-1. |
| `Log.frobenius_chart` | §§8.1–8.2: alpha is a monoid map, the ring delta and log compatibility are bundled, and the factor 1+p delta_log(m) is retained. |

Additional example checks cover the shift in the completed-localisation
counterexample, the m-n filtered exponent, the two-endomorphism Koszul
sign, the dyadic epsilon Frobenius coefficient, degree t_H-t_N, factorial
valuations 1 and 3, a nonfree monoid relation and a nonzero period
parameter. These are elementary witnesses of the conventions; they do
not purport to state the heavy constructions at absent carriers.

Validation results:

- All three `scripts/check_blueprint.py` runs passed with **0 errors,
  0 warnings**: the accepted PR.0 and PR.8 packets and the supplementary
  main packet. Their status/review fields were not changed.
- All **369/369 accepted target anchors** remain. The two parts have
  835 API entries (834 distinct names as counted by the validator) and
  494 packet Checks. No original API identifier was lost. All 127
  accepted definition/construction blocks still have at least three
  named Checks. The seven additional assembly nodes were reconciled
  separately above.
- All original explicit anchors remain and internal anchor links resolve.
  The 388 checkpoint numbered subsections became 389 by adding §8.76a;
  title changes identify the strengthened/corrected interfaces rather
  than deleting target payloads. The checkpoint's 153 Check blocks became
  163. The inherited invalid `DerivedLogPrismatic.zeroLog_not_discrete`
  test remains corrected to `DerivedLogPrismatic.zeroLog_cotangent`.
- `lean-check research/blueprint/packages/PrismaticCohomology/Suggested.lean`
  passed, **exit 0, 26 sorry warnings and no errors or other warnings**.
  The absolute file was checked through the shared pinned build after
  checking available memory. No Lean server, new project, lake build,
  update or cache command was started.
- `scripts/check_sorry_data.py`, `git diff --check` and
  `research/blueprint/intake.py check-files` pass; intake checks the four
  allowed deliverable paths and reports **0 problems**.

There is no remaining checkpoint task for the next packaging worker.
The next step is independent package review of this complete submission,
particularly the two mathematical resolutions and the explicit expanded
foundation contracts. A successful structural check or Lean build must
not be presented as certification of those mathematical arguments.
