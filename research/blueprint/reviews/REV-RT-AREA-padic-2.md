# REV-RT-AREA-padic-2

Independent verification of all 46 findings for issue #1512.
Verifier: **Codex — codex-hjdg0j**, 2026-09-24. Input red-team author:
**Claude Code — cc-39fac3**. This verifier did not produce the input red team.

**44 confirmed; 2 rejected (38, 41).** Confirmation applies to the precise
scope and corrected repair in each reason, not every assertion or alternative
in the input. The JSON gives exactly one decision per finding; the same reasons
appear below. This review does not implement the follow-up fixes.

## Baseline and method

Repository baseline: `38592ad98899a5e675620c15e5645d72be905db9`.
Read all 46 findings, their report evidence and the relevant stage contracts
and fine nodes in the eight target roadmaps and adjacent suppliers/consumers.
Checked the accepted RS-01, RS-05 and RS-26 ownership boundaries, RS-20's
unaccepted status, relevant routed-paper proposals, and the library-coverage
aggregate. None of the eight target roadmaps has accepted coverage in that
aggregate at this baseline, so pending audit claims are not treated as proof.
This is a verification of the findings and their repairs, not a fresh complete
blueprint or a claim to have read every source proof or decomposition node.

Assembled the snapshot read-only from its atlas, accepted links/restructurings,
blueprints and fine decompositions: **2608 stages and 7361 unique directed
prerequisite/edge pairs**. Checked both forward reachability and reverse paths.
For the selected repair union, tested each new edge for a return path in the
entire augmented graph with that edge removed. **All 61 selected additions
have no return path.** This means they introduce no cycle; it does not certify
that the pre-existing graph is a DAG. The primitive-comparison child is a
proposed vertex, with its inputs and outputs listed below. Creating, splitting
and moving actual nodes still requires graph validation by the fixer.

The rejected reverse AI.3/P8 edge has an existing opposite path. In contrast,
adding both curve-route inputs to R06.2 along with the selected union produced
no new cycle. Berger's route is selected for a concrete proof plan, not because
the alternative was found cyclic. Existing R07.1→R28.5, R07.2→R28.2 and
R06.1→R28.2 paths are retained; the input's claims that those paths are missing
are corrected in the decisions.

Pinned libraries: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Inspected positive
declarations at those commits and checked each inspected file against its
pinned Git blob hash. Full-tree targeted searches distinguish the existing
Kähler differential, period-ring, isocrystal, completion and algebraic trace
carriers from the missing complexes, comparison theorems and analytic bounds.
Incidental Koszul signs, unrelated geometric Koszul formulas, bibliography
entries and automatic-series Christol references do not supply these targets.
Negative searches support the specific gaps; they are not universal proofs of
nonexistence under every possible name.

## Constraints on the combined repair

- Separate ordinary integral Witt sheaves from their derived completion.
  AI.3 supplies the integral constructions; P8 supplies rational period sheaves
  and structural completion. The immediate canonical arrow goes to derived
  completion, not backwards. Keep the corrected covers from Scholze's erratum.
- Add a genuine global primitive-comparison producer. A local AΩ comparison
  does not supply the proper global étale comparison by itself. Keep BMS1's
  de Rham Theorem 5.1 distinct from Scholze's primitive Theorem 5.1.
- Use the later CR.3:Frobenius-isogeny successor for rational crystalline
  base change; do not ask early CR.3 to supply a later theorem implicitly.
- Keep one ordinary de Rham and generic Koszul constructor, but preserve
  separate PD, continuous-cohomology, Buchsbaum–Rim and comparison obligations.
  BMS's cochain Koszul/derived-tensor formula includes the degree shift.
- Preserve general local-field/ramified-Witt and characteristic-p FF periods.
  The existing Mathlib mixed-characteristic carrier cannot replace them all.
  Reuse its overlapping fixed-Q_p carrier through proved identifications.
- Extend the actual Kummer-tower Kisin functor required by PR.7; cyclotomic
  field-of-norms theory is not automatically that functor. Keep early annulus
  foundations independent of late Wach/Kisin comparisons.
- Separate relative from absolute Nygaard filtrations. PR.3 supplies relative
  twists/Nygaard, PR.5 the absolute theory and PR.4 the syntomic construction.
  WCart uses formal/completed stack and module interfaces.
- Preserve source ranges: early conditional versus later general prismatic
  de Rham comparison, pro-sheaf versus fixed-level logarithmic Witt exactness,
  finite-level log crystalline hypotheses and scheme/formal/adic site adapters.
- Import dagger carriers once. The rigid comparison concerns the appropriate
  dagger tube; its boundary variants need proofs. Keep the global Euler/index
  theorem after rigid cohomology and local irregularity in the early RD prefix.
- Re-parent the slope-filtration theorem without moving its local-monodromy
  deduction backwards. Preserve the documented unread gaps and partial status.

## Pinned source checks

- [Mathlib/RingTheory/Perfectoid/FontaineTheta.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/FontaineTheta.lean): lines 39–60, 145–208.
- [Mathlib/RingTheory/Perfectoid/BDeRham.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/BDeRham.lean): lines 14–111.
- [Mathlib/RingTheory/Perfection.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfection.lean): lines 611–652, 796–842, 470–496.
- [Mathlib/RingTheory/WittVector/Frobenius.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Frobenius.lean): lines 268–298.
- [Mathlib/NumberTheory/Padics/Complex.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/Complex.lean): lines 122–151, 226–265.
- [Mathlib/RingTheory/Perfectoid/Untilt.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/Untilt.lean): lines 25–58.
- [Mathlib/RingTheory/WittVector/Isocrystal.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean): lines 85–157.
- [Mathlib/RingTheory/Kaehler/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean): lines 126–164, 183–217.
- [Mathlib/RingTheory/Regular/RegularSequence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Regular/RegularSequence.lean): lines 10–27.
- [Mathlib/Algebra/Homology/LocalCohomology.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/LocalCohomology.lean): lines 30–49.
- [Mathlib/FieldTheory/NormalizedTrace.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/NormalizedTrace.lean): lines 48–116.

RegularSequence and LocalCohomology were checked for their explicit outstanding
Koszul-construction comments, not cited as positive implementations. The other
positive declarations retain their ambient primality, completeness, field and
Frobenius hypotheses as specified in the decisions. No Lean compilation or
completed mathematical formalization is claimed by this review.

## Decisions

### RT-AREA-padic-2/1 — confirmed (high)

Confirmed. AI.2 promises both directions of the finite-free classification and cites “Theorem 4.28 and its proof”, but BMS1 v3 pp.42–43 refers the classification proof to Scholze–Weinstein and gives only the direct full-faithfulness argument in Remark 4.29. Berkeley Lectures, printed pp.104,106,109,111,115–116 (PDF pp.114,116,119,121,125–126), explicitly supplies the phi-module/shtuka/pair equivalences, the extension via isocrystals, and the punctured-Spa-A_inf vector-bundle theorem used by Theorem 14.1.1. RF4:vector-bundles provides Beauville–Laszlo patching, not those extension/classification theorems, and their exact obligations have no assembled producer. Re-source AI.2 and assign these proof leaves to the existing RF/VB owners or an early extension of them, keeping the actual finite-free equivalence at AI.2. Add the acyclic VB0 input, but reuse Mathlib’s WittVector.Isocrystal/IsocrystalHom/IsocrystalEquiv carriers rather than planning them again. The general Dieudonné–Manin and analytic extension arguments remain work. Preserve algebraically closed characteristic-zero C, Frobenius normalization and the lattice range; BMS1 also warns the inverse equivalence is not exact. For Lemma 4.27 explicitly obtain FF Corollary11.1.14, whose proof was not read in this review. Do not narrow to full faithfulness without moving the essential-surjectivity obligation and checking PR.7’s demand.

### RT-AREA-padic-2/2 — confirmed (high)

Confirmed the missing ordinary and PD de Rham constructions. DD.0 currently constructs the cotangent complex and derived powers; DD.2 assumes the ordinary de Rham functor, and CR.2 assumes the PD-envelope de Rham complex. C5 explicitly constructs only the smooth complex-variety instance. At both pins the complete de-Rham source search finds only Mathlib’s period rings and a combinatorial comment; KaehlerDifferential and KaehlerDifferential.D exist but do not construct the complex. Give DD.0 the generic exterior algebra with differential, d²=0, Leibniz/functoriality and correctly qualified base-change/localization/completion results. CR.0/CR.2 own the PD quotient and envelope calculation, reusing DD.0 and the existing divided powers. Stacks 07HQ/07HZ explicitly supplies the universal PD derivation and the exterior differential. Add DD.0 → C5 and RT.1, retaining C5’s analytic comparison and RT.1’s HKR/Connes-B proof. Base-change comparison is not an unconditional assertion about arbitrary ordinary tensor products.

### RT-AREA-padic-2/3 — confirmed (high)

Confirmed the missing producer and the local/global conflation. Sch13 v2 Theorems 1.3 (including its relative proper-smooth assertion) and 5.1, pp.3,28, supply almost primitive comparison and finiteness; the proof of 8.4, p.49, explicitly uses 5.1. BMS1 Theorems 1.10(iv),5.7 and CK pp.3,67 make the dependence concrete. AI.4 locally compares AΩ[1/µ] with (Rν_*A_inf,X)[1/µ]; identifying proper global cohomology with integral étale cohomology needs primitive comparison and its derived limits. The atlas has consumers and an explicit P8 coverage gap but no producer, and the pinned source search finds none. Create an early primitive-comparison child importing the integral sheaves/almost acyclicity of AI.3, the local input of P8:local-rational, perfectoid almost purity and the relevant adic étale sites/cohomology. Export to AI.5, AI.6, CP.3, CP.4, P8 and IG.3 with exact coefficient/proper-smooth/base hypotheses and derived-completion obligations. Keep the Sch13 erratum’s corrected covers. The CP decomposition’s recalled BMS1 Theorem 5.1 is a de Rham comparison, not Sch13’s different Theorem 5.1; fix that locator without treating the two theorems as identical. Joint graph validation is recorded below.

### RT-AREA-padic-2/4 — confirmed (high)

Confirmed the missing Kummer-tower/crystalline-lattice branch and its dependencies. R07.4 states group classification but PR.7 invokes an all-crystalline Kisin functor; PG.0’s explicit field-of-norms theory is cyclotomic. Conrad pp.2,21–22,31 identifies the rigid-disc/slope construction, Fontaine’s G_K∞ equivalence and the full-faithfulness result for crystalline restriction. Extend R07.4 with the Kummer tower, étale phi-module equivalence, finite E-height modules and the lattice functor, including Tate-shift/weight conventions and proof of the comparison diagram. Import the early annulus and RD slope input; either extend PG’s tower-specific field-of-norms scope with explicit comparison or construct the Kummer variant under R07, never silently substitute the cyclotomic tower. Add R07.4 → PR.7. The pins contain no Breuil/Kisin implementation. Draft EXT-07 nodes are candidates for source review, not accepted evidence of closure.

### RT-AREA-padic-2/5 — confirmed (high)

Confirmed the substantive missing Tate and Raynaud suppliers, with corrections to the claimed statements and graph result. R07.1/2 do not plan Tate’s full-faithfulness/Hodge–Tate results or Raynaud §4. Tate’s original Proposition 2 (printed p.164) is a discriminant formula; derive the invariant-differential length used by Faltings rather than relabeling the proposition. Theorem 2 (p.176) is H^0/H^1 vanishing for a character defining an eventually totally ramified Z_p-extension. The unrestricted assertion “C-realization C(k) implies cyclotomic^k times finite order” is not that theorem: the Faltings determinant argument additionally uses its GLOBAL class-field-theoretic character form. Preserve those hypotheses and separate that deduction. Tate Theorem 3 Corollary 2 and Theorem 4 (pp.180–181; BC 7.2.8 p.94) give the Hodge–Tate decomposition and generic-fibre full faithfulness. Raynaud §§4.1–4.2 (pp.271–273) supplies the determinant results, with strictly henselian mixed-characteristic base and e≤p−1 only where 4.1.1 imposes it. Preserve the deformation-to-ordinary proof input for 4.2.1. R07.2 → R28.2 ALREADY EXISTS via accepted fine links; retain/use that path and connect new producer nodes, rather than report a new missing stage edge. R07.1 also already reaches R28.5.

### RT-AREA-padic-2/6 — confirmed (high)

Confirmed as a scope/source mismatch, not a counterexample to the smooth special case. BS22 v4 Theorem 9.1, pp.71–73, explicitly permits any p-adic formal scheme over the perfectoid base, and its proof uses derived prismatic cohomology and arc_p-local perfectoid replacements. PR.4 instead attributes smoothness to §9. State the full derived nearby-cycle and affine Spec(S[1/p]) identifications, with the perfect base prism, coefficient exponent and derived phi-fixed-point conventions intact; retain Theorem 1.8(4) as a smooth specialization. Add Lemma 9.2 and the separate, un-inverted étale-sheaf statement of Remark 9.3, with their proof obligations. PR.2 already owns the derived extension, so reuse it. Do not turn Theorem 9.1 into an unrestricted syntomic comparison; Theorem 9.4 distinguishes positive Tate twists from twist zero.

### RT-AREA-padic-2/7 — confirmed (high)

Confirmed a false statement under the printed Definition 7.20. I read arXiv v1 pp.11,13,17,26,31 and checked p.31 visually. Take n=1 and monoid 0 throughout: F_p→F_p[x,y]→B=F_p[x,y]/(x²,xy,y²). The first map is smooth and of Cartier type; the second is a strict effective epimorphism, and all rings are F_p-flat. Hence it satisfies the printed definition. The local ideal has height 2 but three minimal generators, so this is not an lci quotient. Proposition 6.11 identifies log and ordinary derived de Rham, and Example 3.21 gives an unbounded-below complex, whereas RΓ of the crystalline structure sheaf has no negative cohomology. Thus Comp_f cannot be an equivalence. The proof invokes Theorem 3.27/Corollary 3.40, which explicitly require lci/regular-sequence hypotheses. Replace DD.6’s target by a source-qualified corrected statement: require the strict quotient to be lci (locally a regular-sequence quotient) with the flatness needed for 3.40, and give a precise filtered-colimit formulation when using ind-log-smooth examples. This review does not certify that adding an ambiguous “after passage to the inductive limit” clause proves every case of Example 7.21; retain that verification as work. Keep Example 7.23 and add this independent failure test. Record a sourceIssue and check dependent uses such as Theorem 8.4. The local register lists only Remark 8.7/Corollary 8.6 for this paper; arXiv lists only v1, and the public author PDF still has the same definition and proof. A bounded title/7.22/errata search found no correction; one arXiv version alone would not establish novelty.

### RT-AREA-padic-2/8 — confirmed (medium)

Confirmed against CR.4 and BMS1 §§10.2–10.5, pp.81–85. The relative complex is initially defined for B/A over any Z_(p)-algebra A, whereas CR.4 confines it to p-nilpotent bases while claiming to supply the O_C applications. Extend the constructor and universal F–V–procomplex scope, keeping the precise Teichmüller identity, étale base change (10.4/10.8), Laurent-polynomial basis/integral-part calculation (10.12/10.13), and continuous version (10.10/10.11). Proposition 10.14 additionally proves Tor independence and base change for perfectoid base maps and smooth R, not arbitrary base maps. Keep nilpotence and smoothness where required by the classical crystalline comparison; do not transfer that comparison unqualified to every Z_(p)-algebra.

### RT-AREA-padic-2/9 — confirmed (medium)

Confirmed from the three P8:local-rational nodes, AI.3’s text, the accepted RS-01 ownership table and BMS1 Definition 5.4/Remark 5.5/Lemma 5.6, pp.46–47. Move the completed integral sheaf and its affinoid-perfectoid calculation to AI.3, preserving hypotheses, proof steps and incoming/outgoing references. AI.3 must separately name W(Ô^+_{X♭}) and its derived p-completion A_inf,X; the source explicitly does not identify them on arbitrary objects. Add BMS1 §5 and the canonical map from the ordinary Witt sheaf to its derived completion, with only the source-supported almost/completion and affinoid-section comparisons. P8 imports these and constructs the rational sheaves from the ordinary Witt sheaf in Sch13’s convention. Do not silently equate either the two sheaves or their derived sections.

### RT-AREA-padic-2/10 — confirmed (medium)

Confirmed the dependency reversal: AI.3 already precedes P8:local-rational, so the proposed reverse prerequisite cycles. Move the rational/structural comparison and the structural O B_dR^+ completion prescription into the latter. The erratum, items (1) and (3), separates corrected transfinite covers from structural period-sheaf completion: retain the corrected covers in AI.3 as well. Correct the proposed arrow: ordinary W(Ô^+_{X♭}) maps canonically to its derived completion, hence after inverting p the immediate direction is ordinary B_inf → A_inf,X[1/p]. A reverse arrow or identification requires a proved localization/almost-comparison result and cannot simply be asserted. Preserve the erratum’s order: p-completed tensor product, invert p, then ker(theta)-adic completion and sheafification.

### RT-AREA-padic-2/11 — confirmed (medium)

Confirmed the missing rational crystalline base-change input: BMS1 p.120 explicitly uses Proposition 13.21 to establish the BKF property, and p.116 proves that proposition using rational Frobenius invertibility, descent and crystalline base change. CR.3 has no path to AI.5 in the assembled graph. The repair must respect the already separated CR.3:Frobenius-isogeny child: retain that theorem there, and put 13.21 in this later crystalline successor (or an explicitly dependent child), importing CR.3’s base change and finiteness. Export the result to AI.5 and CP.2. A bare CR.3 → AI.5 edge does not license assuming its later isogeny theorem. Preserve proper smooth formal X, the chosen residue-field section k → O/p, phi linearization and inversion of p; do not assert an integral or section-free base change.

### RT-AREA-padic-2/12 — confirmed (medium)

Confirmed. CR.4 has no DD.3 prerequisite path, while BLM Theorem 3.3.6 and Corollary 3.3.8 (p.35), then Theorem 4.2.4 (p.45), explicitly use the classical Cartier isomorphism to compare completed de Rham with the saturated complex. DD.3 already owns the classical smooth calculation alongside derived Cartier. Add DD.3 → CR.4 and specify the perfect F_p-algebra base of 3.3.6; the lift comparison also needs p-torsion-freeness and a Frobenius lift. Do not identify every singular classical complex with its saturated replacement. The pinned library search and the absence of an ordinary de Rham complex confirm that this is not an existing-library theorem.

### RT-AREA-padic-2/13 — confirmed (medium)

Confirmed. AI.6 promises comparison to the smooth generic fibre’s canonical B_dR^+ deformation, and CP.3 owns that object but is not an ancestor. CK §6 introduction (p.59) explicitly names the BMS §13 object as the target; its semistable comparison is not an independent definition of that target. Select CP.3 → AI.6, retaining CK’s properness, semistable/log hypotheses and topology-comparison work. Moving the comparison to CP.4 is an alternative, not an additional prerequisite to introduce indiscriminately.

### RT-AREA-padic-2/14 — confirmed (medium)

Confirmed the missing source-qualified log-crystalline extension. CR.5’s current sources and targets do not supply CK’s non-coherent integral quasi-coherent setting. CK §§5.1–5.3, pp.32–33, explicitly uses Beilinson’s post-publication framework, uniquely p-divisible characteristic monoids and the log structure from O_C^flat minus zero. Beilinson v4 §1.3 (p.4) proves an envelope theorem over a p-nilpotent log PD base with explicit integrality/quasi-coherence assumptions; §1.5 (p.6) constructs the site; §§1.17 (pp.25–26) gives the unique lifting and its universal property. Extend the CR.5 log-algebra/site ownership and export to AI.6. A non-fine log-geometry prefix alone is not the log crystalline site. Preserve the finite-level-to-p-adic construction; do not infer existence of arbitrary mixed-characteristic nonexact log PD envelopes, which CK expressly avoids.

### RT-AREA-padic-2/15 — confirmed (medium)

Confirmed shared-constructor duplication from DD.1, AI.1 and IHG.6. BMS1 Definition 7.1 (p.56) defines the commuting-endomorphism cochain Koszul complex; complete pinned-source searches find signs, differential-geometric Koszul formulas and explicit future-work comments, not this complex. Assign its generic construction, functoriality, symmetry and ring-element specialization to DD.1, and add DD.1 → IHG.6. Keep AI.1’s continuous group-cohomology/Lη applications and IHG.6’s Buchsbaum–Rim/grade/exactness results distinct. Correct the proposed tensor formula: BMS places K_M in degrees 0 through d, so its derived-tensor identification with M tensor^L_{Z[T_1,...,T_d]} Z is UP TO THE SHIFT BY d, as the source expressly states (equivalently formulate the appropriately shifted homological convention). An unshifted identification is false already for d=1 and the zero endomorphism.

### RT-AREA-padic-2/16 — confirmed (medium)

Confirmed the missing logarithmic subsheaves and their supplier edge. CMM v2 pp.46–47 defines them as the étale dlog image and uses pro-sheaf exactness; CR.4 currently only names dlog, while PR.4 consumes the logarithmic comparisons without a CR.4 path. Add the source-qualified definitions and CR.4 → PR.4. Retain the indexing R^{s-r} for s≥r, rather than the reversed exponent appearing in a later displayed diagram. The R−F sequence is a sequence of PRO sheaves; do not assert that its kernel at every fixed level is W_r Ω_log or that p^r is levelwise injective. Keep regular/F-finite/noetherian/henselian hypotheses where CMM’s relative global-section lemma needs them. The Zariski/étale dlog-image agreement is a separate comparison cited there to Morrow, not permission to transfer étale exactness to the Zariski topology without proof.

### RT-AREA-padic-2/17 — confirmed (medium)

Confirmed only as an explicit baseline/API correction. AI.0 already instructs reuse, and accepted RS-01 already names the Mathlib BDeRhamPlus/BDeRham carriers; this is not evidence of an implemented replacement. At 082e2d3 I read PreTilt (Perfection.lean:634), WittVector.frobeniusEquiv:286, WittVector.fontaineTheta:165 and its Teichmüller formula:182, root-level surjective_fontaineTheta:195, and BDeRhamPlus/BDeRham:77/90. Their hypotheses include primality, p nonunit, p-adic completeness and, for surjectivity, Frobenius surjectivity mod p. Cite these in AI.0 and R06.1, and prove the actual perfectoid instances and coefficient identifications. Keep mu/xi normalization, tilde-theta, residue maps and twists. Coordinate finding 21: the general principal nonzerodivisor kernel theorem belongs to P1; AI.0 specializes it and identifies its chosen xi, rather than constructing it a second time. Mathlib explicitly leaves the extended theta map and DVR property as TODOs. Its generalized definition is zero in characteristic p and does not itself give the integral/ramified-Witt period rings for every Fargues–Fontaine divisor.

### RT-AREA-padic-2/18 — confirmed (medium)

Confirmed missing proof-route dependencies, without endorsing the universal assertion about every known proof. Select Berger’s slope route: his pp.2–3 explicitly invoke Kedlaya’s slope filtration, and the proof/Remark V.2.2 on p.22 reconstructs the representation through the étale Robba equivalence without using the local-monodromy theorem. Import the RD.1 slope theorem after the relocation in finding44 (RD.2 is a safe broader ancestor), PG.2 and the early annulus prefix. State the degree/slope and stable-lattice comparison, and match the coefficient-field scope: PG.2 currently promises finite extensions of Q_p, whereas Berger also treats perfect residue fields. Either restrict the target to the common scope or extend the supplier with proof. The FF-curve route is an alternative requiring its own source audit. My joint graph test found no cycle even when its two candidate edges were added; I select the Berger route for a concrete proof plan, not because the alternative was shown cyclic.

### RT-AREA-padic-2/19 — confirmed (medium)

Confirmed the missing Robba realization and Weil–Deligne interface. Berger 0102179v3 pp.3,6 makes overconvergence and the differential-module bridge explicit before the potentially semistable conclusion. PG.2 owns the former; R06.3 must construct the latter and import R01.2’s WD carrier/conventions, while keeping its coefficient-prime monodromy proof distinct from R01.2’s prime-to-residue-characteristic theorem. Use PG.2 → R06.3 and R01.2 → R06.3 (PG.2 may become transitive after finding18). Apply Berger’s correction in 0406601v1 Appendix B, pp.26–27: coefficient fields, logarithm domain, density versus surjectivity, matrix convention and N(log pi)=−p/(p−1) all require care. This review verifies the bridge dependence, not an entire rereading of Berger’s proof.

### RT-AREA-padic-2/20 — confirmed (medium)

Confirmed the missing explicit Tate–Sen producer and trace estimates. BC Theorem 2.2.7 (p.15) states the C_K invariants and H^1 computation; p.22 uses it for B_HT invariants. Mathlib Algebra.normalizedTrace is an algebraic linear map over a characteristic-zero base and algebraic extension, not its continuous extension or the required cohomology theorem. Add the trace bounds/completed cyclotomic descent and Tate–Sen theorem in the early R06.1 scope. Two corrections matter: the character result needs the finite-inertia/ramification and character-image hypotheses (and Faltings’ separate global class-field argument), not unconditional finite global order; and the P8 node actually reduces to H^q_cont(Gamma_k,Q_p(i)), so include the completed-cyclotomic descent comparison rather than substitute a G_K,C_K theorem without a map. R06.1 already reaches R28.2 through fine links; preserve that path rather than report a new missing stage dependency.

### RT-AREA-padic-2/21 — confirmed (medium)

Confirmed the repeated primitive-kernel proof and missing fixed-Q_p reuse boundary, but reject the proposed blanket replacement of RF2 by Mathlib/R06.1. The P1 node and R06.1 node both prove theta-kernel generation/nonzerodivisibility; have R06.1 import P1 and retain the uniform base-change/generator identification it actually needs (Sch13 Lemma 6.3 and Corollary 6.4, pp.35–36). R06.1 owns the mixed-characteristic affinoid filtration on the existing Mathlib carriers. RF0 explicitly supports arbitrary local E with ramified Witt coefficients, and the RF2 node retains integral divisors and nontrivial graded line bundles. In FS VI.2, Remark VI.2.1 (current public PDF p.194), the characteristic-p divisor has B_dR^+(C)=W_OE(C); Mathlib BDeRhamPlus applied to a characteristic-p ring is explicitly zero. Thus one existing Mathlib carrier does not serve every untilt in the claimed generality. Add the acyclic R06.1→RF2:untilts comparison/import for the overlapping generic Q_p case, retain all-E/integral constructions and descent, and prove the coefficient-change identification before extending that reuse. Graded pieces are I^m/I^(m+1), not globally free R(i) without the appropriate twist/trivialization. RS-20 remains needs_changes; its generic-divisor owner is not automatically a contradiction of accepted RS-01’s arithmetic period-ring owner.

### RT-AREA-padic-2/22 — confirmed (medium)

Confirmed the named-application ownership mismatch. R06.5 claims the modular-curve, Kuga–Sato and Shimura-curve applications, while R19.5 explicitly combines the independently supplied R06 comparison with its later geometric inputs to prove the representation-specific Hodge properties. The stated geometry is not available to R06.5, and GH.0 is downstream, so reversing that dependence is not a repair. Keep general proper smooth/semistable and available abelian-variety period-functor consequences in R06.5; make the three named automorphic examples downstream applications under R19.5 and their actual geometric suppliers, with higher-rank applications under AG2.6. Preserve admissibility, filtration, dual and Tate-twist compatibility targets; no mathematical work should disappear when the ownership sentence is narrowed.

### RT-AREA-padic-2/23 — confirmed (medium)

Confirmed the named-but-unavailable suppliers by reading CP.4–CP.6 and testing the assembled graph. Add PR.8 → CP.4; R06.4 → CP.5 supplies the already imported R07.3 as well (a direct R07.3 edge may document that theorem); add PR.4 and EDC.3 → CP.6, then CP.6 → R06.6 for the promised export. Assign the source-qualified prismatic/syntomic/crystalline first-Chern constructions once, e.g. PR.4 with its crystalline inputs, and keep CP.6 as the compatibility proof. BL §7.3/7.4 explicitly constructs the crystalline class and syntomic fibre. This does not close higher Chern/projective-bundle formulas by naming the first class: retain the BL §9 splitting/projective-bundle work and its proper scope as explicit targets. EDC.3’s scheme-theoretic classes require the appropriate formal/adic comparison before use on generic fibres.

### RT-AREA-padic-2/24 — confirmed (medium)

Confirmed the absent arc_t supplier, independently of the existing paper routing. BS22 Theorem 9.1’s proof uses arc_p-descent and the perfectoidization calculation; Bhatt–Mathew v4 Definition 6.14 and Corollary 6.17 (pp.51–52) give the exact rank-one valuation test and torsion-sheaf descent for RΓ(Spec(R-hat_t[1/t]),G). Neither the atlas stage inventory nor the pins supplies that topology. The complete paper extraction routes a proposed ArcTopologyAndDescent, but a routing proposal is not a live prerequisite. Record explicit requests for its arc/arc_t foundations and this theorem; PR.2 retains the BS22 §8.2 perfectoidization/descent application, and PR.4 imports it and the generic-fibre descent. Do not replace this by the perfectoid-space v-topology without proving the required scheme/formal-scheme comparison. Future edges require validation when the actual supplier stages exist.

### RT-AREA-padic-2/25 — confirmed (medium)

Confirmed the missing scheme and adic cohomology interfaces, beyond A1’s geometric site construction. Add SF.2 and H0 as cohomology suppliers for PR.4, and H1:henselian for the selected Huber Spec/Spa route in BS22 Theorem 9.1. Keep the torsion Z/p^n coefficients, plus rings and completion hypotheses. BS22 also offers a valuation-ring alternative to that particular Huber step; H1 is a proof-route choice, not a theorem-independent necessity. The source comparison is cohomological, not an equivalence of all algebraic and analytic sites. Passing to Z_p requires the derived inverse limit separately.

### RT-AREA-padic-2/26 — confirmed (medium)

Confirmed the missing Cartier dependency. BS22 Corollary 5.5, pp.49–50, reduces to polynomial F_p-algebras and explicitly invokes Cartier; the Hodge–Tate argument then uses this characteristic-p case. DD.3’s polynomial Cartier node owns that calculation, but DD.3 has no prerequisite path to PR.1. Add DD.3 → PR.1 and attach its theorem-level link to the characteristic-p comparison. Preserve the Frobenius twist, multiplicative comparison and Bockstein differential; do not replace the comparison by an untwisted direct sum.

### RT-AREA-padic-2/27 — confirmed (medium)

Confirmed a proof-order/source-scope error. BS22 Theorem 6.4 (p.53) assumes W(A/I) is p-torsion-free and explicitly postpones removal of that assumption. Corollary 15.4 (p.104) uses the Frobenius–Lη equivalence of 15.3. PR.1 should state the early conditional theorem; PR.3 owns the general bounded-prism/smooth-formal theorem and Corollary 15.5. Do not add PR.3 → PR.1, which would reverse the existing proof order. Retain phi_A-twisted derived p-completed tensor products, including the source’s precise examples satisfying the extra early hypothesis.

### RT-AREA-padic-2/28 — confirmed (medium)

Confirmed overlapping ownership and a missing input to the syntomic construction. BL Construction 7.4.1 (p.177) is the fibre of divided Frobenius minus inclusion on the ABSOLUTE Nygaard piece, with its BK twist, formed in the derived p-complete category. Assign prism twists and relative Nygaard to PR.3, absolute prismatic cohomology/absolute Nygaard to PR.5, and syntomic construction/comparison to PR.4; add PR.5 → PR.4. PR.5 imports the common twists rather than deleting their use. Preserve the distinction between formal-scheme syntomic cohomology, invariant under p-completion, and BL §8.4’s scheme version; do not identify them by using the same notation.

### RT-AREA-padic-2/29 — confirmed (medium)

Confirmed the missing shared-stack input. PR.5 invokes shared animated/stack objects, but neither LP1’s quotient/QCoh/Perf constructions nor SF.1’s effective descent reaches it. Add those supplier interfaces and explicitly extend them to the formal/completed setting required here. The precise published-in-arXiv-v1 locator is BL Proposition 3.2.3 (p.41): WCart is the quotient [WCart0/W^×] in Zariski stacks, with WCart0 an affine FORMAL scheme and p-nilpotent test rings. It is not an ordinary affine quotient or a formal scheme itself. The crystal equivalence uses (p,I)-complete modules and completed scalar extension (BL §3.3), so generic algebraic-stack carriers alone do not prove it.

### RT-AREA-padic-2/30 — confirmed (medium)

Confirmed all three missing interfaces. F-crystals Notation 3.1 (p.9) requires v/quasisyntomic descent of locally bounded derived p-complete Z_p complexes whose mod-p cohomology is locally constant with finite stalks; C2’s hyperdescent can supply it after proving preservation/descent of those conditions. I checked ECD Theorem 14.12 and Proposition 17.3 (pp.86–87,97): these use an arbitrary coefficient ring, so no prime-to-p restriction should be imported from the separate general-base-change theorem. Add C2 → PR.7 with the lisse/completion qualification. The essential-surjectivity proof (F-crystals p.26) explicitly invokes the extended-Robba/vector-bundle dictionary, weak-admissibility-to-slope-zero comparison, triviality of slope-zero bundles and SW14.2.1. Add VB2:classification → PR.7 and record the dictionary/comparison proof requests; AI.2’s repaired extension theorem supplies its overlap. Add R07.4 → PR.7 only with the extended Kisin functor of finding4. Finite-free lattices remain the target, not arbitrary torsion representations.

### RT-AREA-padic-2/31 — confirmed (medium)

Confirmed for the shared carrier constructors, with the proposed narrowing qualified. RD.0 explicitly constructs dagger algebras, weak completions, forms, and bounded/full Robba rings even though it already requires F1 and P7:annulus-foundations, whose contracts construct these. The accepted RS-05 F1 entry exports the same dagger carrier to RD.0; the accepted RS-26 first owner entry assigns analytic annulus/Robba carriers, topologies and analytic scalar extension to P7. Its PG.0 entry deliberately retains specialized cyclotomic coefficients and actions. Thus importing the common carrier is the appropriate repair; neither merely adding another edge nor deleting all RD.0's coefficient work suffices. Read Kedlaya finiteness §2.5, pp.15–16: relative Robba rings over reduced dagger algebras use norms on affinoid fringe algebras, and the topology of RA uses their fringe topology; this is more than blindly extending the scalar-field Robba construction. The Bézout assertion there is for the scalar-field ring, not every relative ring. Preserve RD.0's required imperfect-residue/Cohen coefficient extensions, Frobenius choices, relative/fringe constructions, coordinate-change and descent lemmas unless an upstream owner is explicitly generalized to supply them. Add RD.0 to the Robba reuse record, retain the existing two prerequisites, and keep later comparisons out of the early carrier prefix.

### RT-AREA-padic-2/32 — confirmed (medium)

Confirmed, with a precise comparison space and source locator. HLTT arXiv:1411.6717v1 Lemma 6.8, pp.189–190, identifies rigid cohomology of the special fibre of a smooth quasi-projective O_K-scheme with dagger de Rham cohomology of the dagger tube of that special fibre inside the analytic generic fibre. It is not an unrestricted identification with the whole analytic generic fibre. The proof invokes Grosse-Klönne Theorem 5.1 and explains the needed functoriality. HLTT Lemma 6.21 and Corollary 6.22 on p.207 pass through rigid cohomology of boundary strata and Berthelot's finiteness; Corollary 6.24 on p.208 imports Chiarellotto's weight theorem. (The finite-dimensionality corollary is 6.22 in this version, not 6.23.) F1 provides the dagger complexes and their boundary maps, RD.4 the rigid cohomology, RD.5 finiteness, and RD.6 the weight route, but no assembled path supplies the latter three to AG2.4. Targeted atlas searches and these stage contracts do not exhibit the comparison theorem. Add an explicitly functorial, Frobenius-compatible comparison node at RD.4, retaining the source's tube and smooth/quasi-projective hypotheses; separately prove the boundary-stratum/log/compact-support adapters rather than treating all variants as Grosse-Klönne's statement. Keep carrier-level boundary complexes at F1 and import cohomological comparison/finiteness/weights into AG2.4 via RD.4, RD.5 and RD.6. These edges pass the joint graph check. The original GK, Berthelot and Chiarellotto proofs were not independently read here; their exact proof decompositions remain obligations of those owner nodes.

### RT-AREA-padic-2/33 — confirmed (medium)

Confirmed for both missing geometric inputs. Independently read Kedlaya math/0208027v6 Proposition 9.1.2 and its use in §9.1, p.61: the finite étale affine-space neighborhood is a named theorem, with the hypothesis that the chosen geometric point x is smooth, not an assertion about arbitrary singular points. It supplies the finite-pushforward reduction to affine space. Section 9.2, pp.61–62, then explicitly uses de Jong Theorem 4.1 and Tsuzuki's construction of proper hypercovers, with purely inseparable field extensions, base change and descent in the argument. RD.5 names alterations but has no path from L5, which owns the relevant de Jong theorem. The targeted atlas search supplies no finite-étale-affine-space owner; searches of both pinned Lean trees for the specific rigid/alteration-source targets do not supply an implementation (the Kedlaya hit is a condensed-mathematics bibliography link). Add the fully source-qualified cover theorem at RD.5 and L5→RD.5, which is jointly acyclic. Import the alteration geometry only: L5's étale-cohomology descent does not automatically prove descent for rigid cohomology. Name and plan the latter Chiarellotto–Tsuzuki/Tsuzuki input separately, with its field-extension and coefficient hypotheses. The original finite-cover and descent proofs are outstanding proof interiors, not certified by reading their invocation in Kedlaya.

### RT-AREA-padic-2/34 — confirmed (medium)

Confirmed, but the proposed placement of the global index theorem at early RD.1 should be corrected. Independently read Kedlaya math/0210149v3 §4.4, Theorem 4.4.1 and proof, p.33: for a smooth irreducible affine curve, the rigid-cohomological Euler characteristic is rank times the constant-coefficient Euler characteristic minus the degree-weighted boundary Swan conductors. The proof separately invokes Christol–Mebkhout's index formula with differential irregularity and Crew/Matsuda/Tsuzuki's equality of irregularity with Swan conductor. RD.6's conductor/radius phrase does not supply either theorem, and R01.3 is not an ancestor. Atlas and pinned-source searches found no implementation/other owner of these p-adic GOS inputs; unrelated Christol automatic-series and Néron–Ogg–Shafarevich references are not suppliers. Keep local differential irregularity and radii at RD.1, and put the global Euler-characteristic/index theorem after RD.4's cohomology, naturally in RD.6 (or a named intervening successor). Put the irregularity–Swan comparison there with RD.2's local-monodromy input. Add R01.3→RD.6, expanding its conductor construction to equal-characteristic local fields k((t)) when needed; the current number-field/mixed-characteristic scope cannot silently supply that instance. The edge is jointly acyclic. These are source-qualified proof requests: the original CM/Crew/Matsuda/Tsuzuki proofs were not read in this verification.

### RT-AREA-padic-2/35 — confirmed (medium)

Confirmed from DD.5’s actual prerequisites and the assembled graph. Its semiperfectoid/quasiregular semiperfectoid cover construction needs integral perfectoid rings, but no perfectoid supplier reaches it; the pins contain neither a semiperfectoid nor a perfectoid-ring predicate. BS22 Theorem 1.12 and the discussion before 1.16 use precisely a derived p-complete quotient of a perfectoid ring. Add Q0:integral-algebra → DD.5, importing the integral/Tate and completion distinctions. Preserve DD.5’s elementary compatible-root covers; Q3’s stronger André extension theorem must remain downstream, not become an input.

### RT-AREA-padic-2/36 — confirmed (medium)

Confirmed the ownership/dependency ambiguity for the lci derived-de-Rham/PD-envelope comparison cited from Bhatt §3.3. CR.0 promises a derived PD comparison but has neither DD.2 nor DD.3 available; DD.4 explicitly owns Theorem 3.27 and CR.2 already identifies DD.4 as its consumer. Bhatt Corollary 3.40 gives the regular-sequence quotient comparison, while Remark 3.43 (p.18) only announces a separately developed derived PD envelope; it does not construct one for CR.0. Put this cited comparison in DD.4, retaining flat Z/p^n and regularity conditions, and keep the classical envelope/base-change lemmas in CR.0. Do not identify every animated/derived PD construction with derived de Rham by terminology alone: any independently intended derived-envelope theory needs its own explicit definition and proof rather than being silently deleted.

### RT-AREA-padic-2/37 — confirmed (low)

Confirmed a locator correction, not a new second twist constructor. BMS1 Example 4.24 (p.41) constructs A_inf{1}; BS22 Construction 4.9 (p.39) gives the reduction twist and its Bockstein use; Bhatt–Lurie §2.5, Proposition 2.5.1/Definition 2.5.2 (p.28), constructs the general prism twist by transversal approximation and identifies its reduction in Remark 2.5.7. Cite these at the appropriate integral/prismatic owners while retaining BMS §3 for the coefficient elements. General-prism twists require prism algebra; do not force that construction into an earlier integral prefix lacking the prism input.

### RT-AREA-padic-2/38 — rejected (low)

The two quoted sentences do not establish duplicate theorem construction. P8 supplies the relative geometric comparison, while T1 explicitly IMPORTS the period/sheaf/comparison results and applies them to abelian families, identifies the maps with T0, and proves Hodge-tensor compatibility. The P8 → T1 edge exists and the accepted RS-01 ledger preserves the proper-relative comparison separately from downstream applications. Clarifying P8’s “supply degree-one” wording to emphasize the generic input is reasonable editorial work, but no competing carrier, proof or reversed dependency is exhibited; reject the duplicate finding.

### RT-AREA-padic-2/39 — confirmed (low)

Confirmed the two missing interfaces in the assembled graph. R07.6 promises tangent/obstruction calculations for R08, but R08.1’s local deformation functor/ring input does not reach it, and R07.6 has no path to R08.6’s exported local conditions. Add R08.1 → R07.6 → R08.6, restricted to the corresponding finite-flat/p-divisible local conditions. Import the deformation-ring/tangent carrier; retain R07’s actual comparison to group-scheme deformations and its independent ramification bounds. Do not assert that every integral group deformation represents the unrestricted Galois deformation problem.

### RT-AREA-padic-2/40 — confirmed (low)

Confirmed the wrong classification locator. Raynaud Theorem 1.4.1 is in §1 (printed p.255), with hypothesis (**) from p.246: each character eigensheaf is invertible. Sections 3.4.1/3.4.3 (pp.269–270) describe the generic-fibre character/prolongation criterion and explicitly assume a strictly henselian mixed-characteristic DVR. Add §1/1.4.1 for classification, retain the §3 tame-inertia results, and state the strictly henselian reduction/descent needed over a general base. Do not turn the source’s character formula into a formula for the whole Galois action over a non-strictly-henselian base.

### RT-AREA-padic-2/41 — rejected (low)

No mathematical error is established. R06.4 already requires the EXPLICIT restrictions in Fontaine–Laffaille §0.9/§6 and imports R07.3, whose text spells out the excluded endpoint subobjects/quotients. I checked §0.9 (pp.551–552) and Theorem 6.1 (p.581): each restricted category has its own full-faithfulness theorem; R06.4 does not assert full faithfulness on their union or remove the restrictions. The words “nilpotent/unipotent” are shorthand with an exact source reference, not an incompatible theorem. Restating the two conditions verbatim in mathematical notation may improve clarity, but differing terminology alone does not justify an error verdict.

### RT-AREA-padic-2/42 — confirmed (low)

Confirmed the incorrect supplier wording, with a scope correction. Pinned Mathlib already defines PadicComplex as the completion of PadicAlgCl (Complex.lean:137), proves algebraic closedness:244, defines PadicComplexInt:251, and constructs PreTilt/Tilt (Perfection.lean:634/826), PreTilt.untilt (Untilt.lean:49) and the conditional Fontaine theta map. R06.1 should cite those carriers directly and obtain its O_C specialization through AI.0. The assertion that PerfectoidSpaces plans neither object is too strong: P1 does plan general tilts and their topological perfectoid properties. Keep that supplier for those theorems and for comparing its limiting construction to Mathlib’s perfection/fraction-field carrier. The C_K Galois action, compatible finite-extension identification, required instances and topological equivalences still need proof; a definition named Tilt is not a complete tilting theorem.

### RT-AREA-padic-2/43 — confirmed (low)

Confirmed from P7’s complete text and graph reachability. P7 explicitly compares Wach modules with both R07.3 and R07.4 lattice constructions, neither of which reaches it. Add both inputs to the LATE P7 handoff; keep the analytic P7:annulus-foundations prefix independent so that Kisin/slope theory can use it without a cycle. The comparison remains limited to the common crystalline, coefficient-field, integral-lattice and weight ranges; it is not a second Wach classification.

### RT-AREA-padic-2/44 — confirmed (low)

Confirmed the parent/coverage mismatch directly in the accepted decomposition: RD.1’s stage text owns existence/uniqueness/descent of slope filtrations, but the node is under RD.2 and RD.1’s coverage expressly flags this. Re-parent the slope-filtration statement and proof to RD.1 and mark its coverage partial, retaining its unread prerequisite gaps. The current node ALSO contains the local-monodromy deduction using connection stability and Tsuzuki; split or retain that suffix under RD.2 rather than moving it wholesale. Update every link, coverage reference, gap and referenced ID together, keeping RD.1 → RD.2. Relocation does not establish the unread slope-theoretic lemmas or unit-root theorem.

### RT-AREA-padic-2/45 — confirmed (low)

Confirmed. DD.4 explicitly promises the A_cris derived de Rham description but has no AI.0:integral prerequisite path. Bhatt Construction 9.2, Proposition 9.3 and Proposition 9.9 (pp.33–35) show the dependency on the actual A_inf/theta map and its regular kernel. Add AI.0:integral → DD.4 and reuse CR.0’s PD carrier. The proof of 9.9 can use Corollary 3.40 with the regular kernel directly; it need not inherit the overbroad log-lci statement diagnosed in finding 7.

### RT-AREA-padic-2/46 — confirmed (low)

Confirmed PR.8 names AI.6/CR.6 comparisons without either supplier reaching it. Select AI.6 → PR.8 (which also brings its existing CR.6 prerequisite); a direct CR.6 edge can document the Hyodo–Kato interface. Together with PR.8 → CP.4 and CP.3 → AI.6, these introduce no cycle in the assembled graph. Keep CP.4’s rational compatibility assembly separate from PR.8’s actual log-prismatic comparison, and retain their common Cartier-type/log-smooth/perfect-log-prism range. No ordinary-étale replacement of Kummer-étale cohomology follows without the log comparison.

## Public sources and limits of proof inspection

Sources accessed 2026-09-24. The table records passages consulted at **physical
PDF pages, starting at 1**. It does not claim complete reading of every page
or of each source. Statement/printed locators are in the decisions; hashes
identify the downloaded versions. Imported source proofs are not silently
counted as read.

| Source | Physical PDF pages consulted | SHA-256 |
| --- | --- | --- |
| [Bhatt](https://arxiv.org/pdf/1204.6560v1) | 11, 13, 17, 18, 26, 31, 33, 34, 35 | `e5ca4056c89eaed462a12038c29d5c3b0a7e06d02d18a7db6dfdf1cfe9f4f00f` |
| [BS22](https://arxiv.org/pdf/1905.08229v4) | 39, 48, 49, 50, 53, 71, 72, 73, 104 | `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a` |
| [Sch13](https://arxiv.org/pdf/1205.3463v2) | 2, 3, 28, 35, 36, 40, 41, 49 | `ed9187b3269adb7e9964369470073ce8760ef56ef0c0b89538c0a1509f811959` |
| [FS](https://www.math.uni-bonn.de/people/scholze/Geometrization.pdf) | 192, 194 | `7086908002aad4086381c90cc6329b293aeac0996c00816d28169cac0a8083c1` |
| [BMS1](https://arxiv.org/pdf/1602.03148v3) | 7, 41, 42, 43, 46, 47, 56, 81, 82, 83, 84, 85, 116, 120 | `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` |
| [Berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf) | 114, 116, 119, 121, 125, 126 | `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` |
| [Sch13Erratum](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf) | 1, 2 | `3cfa56b9e3875c04240d97739dccd58091e41f714c101d5470b95172f73cb235` |
| [CK](https://arxiv.org/pdf/1710.06145v3) | 3, 32, 33, 59, 67 | `47000db58599c20831223f43df1d13466c913fdda617070f5cc3458631d36c57` |
| [BLM](https://arxiv.org/pdf/1805.05501v3) | 35, 45 | `533f9073572ccefa893706a39b8792b55cb313886e402a7eb6d4c22271687753` |
| [CMM](https://arxiv.org/pdf/1803.10897v2) | 46, 47 | `ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c` |
| [Beilinson](https://arxiv.org/pdf/1111.3316v4) | 4, 6, 25, 26 | `fbe6b5976929db122d55fc0c95958796eace5842f3629351b49b9a53b48bfe4e` |
| [BL](https://arxiv.org/pdf/2201.06120v1) | 28, 37, 38, 41, 173, 175, 177 | `0b1beeb20c29424ed8e330c14a66b36c0edcc84255edf5caa0ff9e235139a269` |
| [Conrad](https://math.stanford.edu/~conrad/papers/luminy.pdf) | 2, 21, 22, 31 | `a25bfbc39f9e6b95445d8e915e7caa4d60fe7d6514868baf914e11ff42725ea1` |
| [Raynaud](https://www.numdam.org/item/10.24033/bsmf.1779.pdf) | 7, 16, 30, 31, 32, 33, 34 | `05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe` |
| [FL](https://www.numdam.org/item/10.24033/asens.1437.pdf) | 6, 7, 36 | `c049a7bff113a45f8bbcffc93118bd2e651e84f8b4a38305f7cb24b34c2011a2` |
| [Tate](https://www.math.purdue.edu/~tongliu/teaching/598/p-divisible.pdf) | 4, 10, 12 | `720bf7128d4f048853435b083d18d0d863056c1f991942192a7f00daa7e424aa` |
| [BC](https://math.stanford.edu/~conrad/papers/notes.pdf) | 15, 22, 23, 94 | `f27d508bc64b3c9e2e9de5041429b2cb6a909b2cd72ff8096c20493f27b5a187` |
| [BergerCF](https://arxiv.org/pdf/math/0406601v1) | 1, 2, 3, 22, 26, 27 | `72559978a50bc293f23353ba85c4fa65b61b2f9efb6b1dc39c8866890964de36` |
| [BergerMon](https://arxiv.org/pdf/math/0102179v3) | 1, 2, 3, 6 | `142e7948f3c2da0cba0e0e764c2543cb3f0cf039470711fae729c9c3d2f54f6c` |
| [Fcrystals](https://arxiv.org/pdf/2106.14735v2) | 9, 26 | `4cbfb297a15347c978f590cfc7b7dab3ab771509c588dc8fd928cff8b067ff59` |
| [KedFin](https://arxiv.org/pdf/math/0208027v6) | 15, 16, 61, 62 | `a4668e61edff20999f5634b19fa372dbf29cbffe50d14180219d175c98583ba3` |
| [KedWeil](https://arxiv.org/pdf/math/0210149v3) | 33 | `b678f13ceb5b0d0b528e927a20187e344f2fd40552819a5d528f7d52ab3f1599` |
| [ECD](https://www.math.uni-bonn.de/people/scholze/EtCohDiamonds.pdf) | 86, 87, 97, 119 | `09def2857071d21c419e1c2b331bfe72a27c6eac61caaef4efd19ed40f1ceda6` |
| [Arc](https://arxiv.org/pdf/1807.04725v4) | 51, 52 | `4cdf5593067a425ca0aebc969d34efa4ef296cde613c3d9a6c671db65b9b6620` |
| [HLTT](https://arxiv.org/pdf/1411.6717v1) | 189, 190, 207, 208 | `66b646fa40ec558b96eeb1c06456051398dbe2021de3d864b4930da001b647f6` |

Additional public references: Stacks [07HQ](https://stacks.math.columbia.edu/tag/07HQ)
and [07HZ](https://stacks.math.columbia.edu/tag/07HZ) for PD derivations and
the PD de Rham complex. The Berkeley PDF's printed pagination is ten less than
its physical pagination. Raynaud and Fontaine–Laffaille use journal pagination;
Tate's scan has two printed pages per physical page.

The direct download of Bhatt's [author copy](https://public.websites.umich.edu/~bhattb/math/padicddr.pdf)
returned HTTP 403; its p.31 was checked through public web PDF text, with no
byte hash claimed for that copy. It retains the Definition 7.20/Theorem 7.22
wording diagnosed in finding 7. The [arXiv version history](https://arxiv.org/abs/1204.6560)
listed only v1. The local errata register and bounded searches for the title,
7.22 and errata did not locate a correction. This is not a claim of exhaustive
novelty. The fix should record the concrete non-lci counterexample and the
needed flat regular-quotient condition as a source issue, while leaving the
ind-log-smooth scope requiring verification explicit. The source's unrelated
previously recorded Remark 8.7/Corollary 8.6 issue does not settle this one.

Known corrections consulted include Scholze's full two-page erratum and
Berger's Appendix B in math/0406601v1, pp.26–27. CMM's transition-index direction
is fixed by its surrounding pro-system, not by copying the reversed displayed
exponent. These source qualifications should remain visible in the follow-up
packet/source-issue records; this two-file verification does not itself update
the errata register.

Unfinished proof interiors include FF Corollary 11.1.14 and the detailed
extended-Robba/bundle dictionary, the general slope and unit-root arguments,
the original Grosse-Klönne/Berthelot/Chiarellotto theorems, the finite-étale
cover theorem and rigid cohomological descent, and the original
Christol–Mebkhout/Crew/Matsuda/Tsuzuki proofs. Reading their explicit invocation
establishes a missing dependency, not completion of their proof decompositions.
Similarly, the first-Chern construction does not establish higher Chern classes
or projective-bundle formulas, and checking a conditional Mathlib declaration
does not establish all required perfectoid/topological/Galois instances.

## Joint dependency check

The following 61 new edges were tested together. Fully qualified stage IDs are
used to avoid collisions. Some become transitively redundant within the union;
the finding reasons govern their final necessity. These are stage-level
interfaces: they do not close the theorem-level requests and scope extensions.
The new primitive-comparison stage name is provisional. The RD.1 inputs assume
the carefully split slope relocation in finding 44. No proposed arc supplier
is invented as a live stage; its future edges need checking when designed.

| Supplier | Consumer |
| --- | --- |
| `AInfCohomology:AI.0:integral` | `DerivedDeRhamCohomology:DD.4` |
| `AInfCohomology:AI.3` | `PadicHodgeTheory:P8:primitive-comparison` |
| `AInfCohomology:AI.6` | `PrismaticCohomology:PR.8` |
| `AdicCoefficientsAndComparisons:L5` | `PadicDifferentialEquationsAndRigidCohomology:RD.5` |
| `AdicEtaleGeometry:A1` | `PadicHodgeTheory:P8:primitive-comparison` |
| `AdicEtaleGeometry:A2` | `PadicHodgeTheory:P8:primitive-comparison` |
| `AdicSpacesPartII:R4` | `PadicHodgeTheory:P8:primitive-comparison` |
| `ArithmeticGaloisRepresentations:R01.2` | `PadicHodgeTheory:R06.3` |
| `ArithmeticGaloisRepresentations:R01.3` | `PadicDifferentialEquationsAndRigidCohomology:RD.6` |
| `ClassicalAdicEtaleCohomology:H0` | `PadicHodgeTheory:P8:primitive-comparison` |
| `ClassicalAdicEtaleCohomology:H0` | `PrismaticCohomology:PR.4` |
| `ClassicalAdicEtaleCohomology:H1:henselian` | `PrismaticCohomology:PR.4` |
| `CohomologyComparisons:CP.3` | `AInfCohomology:AI.6` |
| `CohomologyComparisons:CP.6` | `PadicHodgeTheory:R06.6` |
| `CrystallineCohomology:CR.3:Frobenius-isogeny` | `AInfCohomology:AI.5` |
| `CrystallineCohomology:CR.3:Frobenius-isogeny` | `CohomologyComparisons:CP.2` |
| `CrystallineCohomology:CR.4` | `PrismaticCohomology:PR.4` |
| `CrystallineCohomology:CR.6` | `PrismaticCohomology:PR.8` |
| `DerivedDeRhamCohomology:DD.0` | `ComplexComparisonPartII:C5` |
| `DerivedDeRhamCohomology:DD.0` | `RefinedTraceMethods:RT.1` |
| `DerivedDeRhamCohomology:DD.1` | `IntegralHeckeAndGaloisDeterminants:IHG.6` |
| `DerivedDeRhamCohomology:DD.3` | `CrystallineCohomology:CR.4` |
| `DerivedDeRhamCohomology:DD.3` | `PrismaticCohomology:PR.1` |
| `DiamondEtaleCohomology:C2` | `PrismaticCohomology:PR.7` |
| `EtaleDualityAndPerverseSheaves:EDC.3` | `CohomologyComparisons:CP.6` |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3` | `CohomologyComparisons:CP.5` |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3` | `PadicHodgeTheory:P7` |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4` | `PadicHodgeTheory:P7` |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4` | `PrismaticCohomology:PR.7` |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6` | `LocalGaloisDeformationRings:R08.6` |
| `LanglandsParameterStacks:LP1` | `PrismaticCohomology:PR.5` |
| `LocalGaloisDeformationRings:R08.1` | `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6` |
| `PadicDifferentialEquationsAndRigidCohomology:RD.1` | `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4` |
| `PadicDifferentialEquationsAndRigidCohomology:RD.1` | `PadicHodgeTheory:R06.2` |
| `PadicDifferentialEquationsAndRigidCohomology:RD.4` | `AutomorphicGaloisRepresentationsPartII:AG2.4` |
| `PadicDifferentialEquationsAndRigidCohomology:RD.5` | `AutomorphicGaloisRepresentationsPartII:AG2.4` |
| `PadicDifferentialEquationsAndRigidCohomology:RD.6` | `AutomorphicGaloisRepresentationsPartII:AG2.4` |
| `PadicHodgeTheory:P7:annulus-foundations` | `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4` |
| `PadicHodgeTheory:P7:annulus-foundations` | `PadicHodgeTheory:R06.2` |
| `PadicHodgeTheory:P8:local-rational` | `PadicHodgeTheory:P8:primitive-comparison` |
| `PadicHodgeTheory:P8:primitive-comparison` | `AInfCohomology:AI.5` |
| `PadicHodgeTheory:P8:primitive-comparison` | `AInfCohomology:AI.6` |
| `PadicHodgeTheory:P8:primitive-comparison` | `CohomologyComparisons:CP.3` |
| `PadicHodgeTheory:P8:primitive-comparison` | `CohomologyComparisons:CP.4` |
| `PadicHodgeTheory:P8:primitive-comparison` | `IgusaVarietiesAndTorsionConcentration:IG.3` |
| `PadicHodgeTheory:P8:primitive-comparison` | `PadicHodgeTheory:P8` |
| `PadicHodgeTheory:R06.1` | `RelativeFarguesFontaine:RF2:untilts` |
| `PadicHodgeTheory:R06.4` | `CohomologyComparisons:CP.5` |
| `PerfectoidQuotients:Q0:integral-algebra` | `DerivedDeRhamCohomology:DD.5` |
| `PerfectoidSpaces:P0` | `PadicHodgeTheory:P8:primitive-comparison` |
| `PerfectoidSpaces:P3` | `PadicHodgeTheory:P8:primitive-comparison` |
| `PhiGammaModulesAndIwasawaCohomology:PG.1` | `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4` |
| `PhiGammaModulesAndIwasawaCohomology:PG.2` | `PadicHodgeTheory:R06.2` |
| `PhiGammaModulesAndIwasawaCohomology:PG.2` | `PadicHodgeTheory:R06.3` |
| `PrismaticCohomology:PR.4` | `CohomologyComparisons:CP.6` |
| `PrismaticCohomology:PR.5` | `PrismaticCohomology:PR.4` |
| `PrismaticCohomology:PR.8` | `CohomologyComparisons:CP.4` |
| `SchemeAndStackFoundations:SF.1` | `PrismaticCohomology:PR.5` |
| `SchemeAndStackFoundations:SF.2` | `PrismaticCohomology:PR.4` |
| `VectorBundlesAndIsocrystals:VB0` | `AInfCohomology:AI.2` |
| `VectorBundlesAndIsocrystals:VB2:classification` | `PrismaticCohomology:PR.7` |

## Validation

- Exactly 46 input IDs have exactly one verdict, with no invented or omitted
  findings. The JSON uses the prescribed review schema.
- Run `scripts/check_redteam.py` and `intake.py check-files` on the two permitted
  deliverables; record their actual output in the PR.
- Before publication, compare the evidence-file hashes and the complete graph
  input file set against current main. No input red-team finding, roadmap,
  decomposition, source-issue record or library source is a deliverable here.
- No Lean file is required by this verification and none is changed.
