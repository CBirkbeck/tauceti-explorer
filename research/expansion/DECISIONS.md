# Open decisions from the independent reviews

Generated 2026-09-16 by `research/expansion/collect_decisions.py` from `research/expansion/reviews/*.md`. Every item below is quoted from a review report and is still open: the atlas snapshot (`data/atlas.json`) is immutable, so reversed or missing stage edges, stage texts that contradict their sources, and missing suppliers can only be recorded here or fixed upstream. Reports whose reviewer is still running are marked as such and will be regenerated.

## REVIEW-EXT-01-EXT-15-review.md — last written 2026-09-16 03:24

### Questions and decisions for the orchestrator — 1. GeneralAlgebraicKTheory.json (EXT-01)

1. **Additivity versus S.-delooping ordering.** The atlas has
   `StableHomotopyKTheory:H.5:S-delooping → GeneralAlgebraicKTheory:K.4`. Waldhausen (§1.3
   p. 330, Proposition 1.5.3 via 1.5.5) and Weibel (IV 8.5.5 via V 1.7) prove the delooping
   *from* additivity. The packet routes node-level links the right way. The stage-level edge
   should be reversed, or additivity moved into K.4:construction. Waldhausen's remark on p. 333
   notes that, given §1.3, the two statements are equivalent, but the proof read goes additivity
   ⇒ delooping.
2. **New stage-level edges implied by links:** `GeneralAlgebraicKTheory:K.3 → ArithmeticKTheory:N.1`
   (transfer; N.1 currently requires only K.7) and
   `GeneralAlgebraicKTheory:K.6 → SchemeKTheoryOperations:S.3` (nonconnective localization;
   S.3 currently requires K.3 and S.2). Both are acyclic in the joint validation.
3. **Supplier request:** a statement and proof of the degreewise realization lemma for
   simplicial spaces. StableHomotopyKTheory:H.2 could own it; it is used by Waldhausen §§1.4–1.5
   and Weibel V 1.3.

---

### Questions and decisions for the orchestrator — 2. StableHomotopyKTheory.json (EXT-01)

1. **New stage-level edges implied by links:** `KTheoryLowDegrees:U.1 → StableHomotopyKTheory:H.4`,
   `KTheoryLowDegrees:Z.1 → StableHomotopyKTheory:H.4` and
   `StableHomotopyKTheory:H.2 → KTheoryFiniteLocalFields:L.1`. The atlas has them only
   transitively or not at all; the joint validation shows them acyclic.
2. **Levelwise realization lemma.** Assign an owner (H.2 is natural). It is required by
   GeneralAlgebraicKTheory:K.4 and is only cited in Weibel IV 3.6.1(i).
3. **Weibel IV Exercises 4.6, 4.7 and statement 4.7.1** (invertible actions and the fibration
   S⁻¹S → S⁻¹X → ⟨S, X⟩) are used by the + = Q proof but live in no node. Decide whether H.4
   should own them.

---

### Questions and decisions for the orchestrator — 3. EulerSystemsCyclotomicMainConjecture.json (EXT-15)

1. **Trivial-character component** of the plus-part main conjecture (RJW Thm. 13.8). Neither
   Rubin III.2.10 nor the removed Greither link supplies it; assign it (L3 or
   IntegralIwasawaTheory).
2. **Supplier scope.** ColemanPowerSeries:L4 and IntegralIwasawaTheory:L1 state the
   Q(μ_{p^∞})⁺ case only. If the atlas wants Rubin's general-conductor statements, a
   Gillard-type local-unit theorem needs an owner.
3. **New stage-level edge** implied by a link: `ColemanPowerSeries:L4 →
   EulerSystemsCyclotomicMainConjecture:L3`. The atlas has it only transitively, through L0;
   it is acyclic in validation.

---

### Questions and decisions for the orchestrator — 4. GrossZagierAndArithmeticHeights.json (EXT-15)

1. **Supplier direction around HE.1.** The atlas has HE.1 requiring GZ.3 and GZ.6 requiring HE.1.
   The GZ.6 stage text also says "Construct the CM divisors/correspondences on X_U from HE.1".
   Confirm that HE.1, not GZ.6, owns the CM points, and that GZ.6 owns the special cycles; the
   erratum's push-forward correction has to land on exactly one of them.
2. **Acquisition.** Either acquire the primaries behind `LocalToricAndWaldspurger` (Tunnell,
   *Local epsilon-factors and characters of GL(2)*; Saito, *On Tunnell's formula*; Waldspurger,
   *Sur les valeurs...*), or rule that YZZ Chapter 2 plus Cai-Shu-Tian suffices for GZ.4-GZ.5.
3. **OCR.** `BSD_GrossZagier.pdf` and `BSD_ZhangAdmissible.pdf` are scans with no text layer.
   Either schedule OCR or accept Conrad's *Gross-Zagier revisited* and Zhang's *Heights of Heegner
   points* (both fully extracted) as the working sources.
4. **S^1 versus S^2.** Whoever reads Chapter 5 Sec. 5.2 should settle whether the split-place
   assumption is S^1 as printed, and report it back to GZ.7.
5. **GZ.9 and BDP Thm. 5.13.** GZ.9 is unstarted, and the packet says it shares BDP Thm. 5.13 with
   the EXT-15 GeneralizedHeegnerCycles packet. Decide which roadmap decomposes that theorem so it
   is not done twice with different hypotheses.

---

### Questions and decisions for the orchestrator — 5. KatoEulerSystems.json (EXT-15)

1. **Missing atlas edge.** `data/atlas.json` has `KatoEulerSystems:L4` requiring
   `EulerSystemsCyclotomicMainConjecture:L2`, `KatoEulerSystems:L3` and
   `SelmerIwasawaCohomology:L3` — but **not** `EulerSystemsAndKolyvaginSystems:ES.8`, although the
   packet's (endorsed) link asserts exactly that supply and both stage texts describe it. Add the
   stage edge, or rule that the ES.8 adapter is consumed only through ESCMC:L2.
2. **Acquisition: [KK3].** Kato's *Generalized explicit reciprocity laws* is the load-bearing
   external input to Thm. 9.5 and is absent from the library. Either acquire it, or accept
   Kings-Loeffler-Zerbes (present, unextracted) as the working source and re-anchor L3.
3. **Hypothesis (v) of Thm. 13.4** has no owner: Kato verifies (ii)-(iv) and notes (v) fails for CM
   forms, but never discharges it for non-CM forms in §§12-13. Assign whoever reads §§14-15.
4. **`per_f` and f\*.** The interpolation constant is now transcribed, but the period normalisation
   `per_f` and the dual form f\* are unread. They are what the L3 stage text's "normalization
   dictionary" actually needs; assign them with §16.
5. **Text-layer policy.** This paper's Numdam digitisation silently drops exponents and whole
   displays. Any packet quoting Kato from the text layer should be re-checked against page
   renderings; three errors here came from exactly that.

---

### Questions and decisions for the orchestrator — 6. GeneralizedHeegnerCycles.json (EXT-15)

1. **Extraction policy.** Four sources this packet depends on have PDFs but no library extraction.
   Either extract them into `references/text/` centrally, or state that workers should run
   `pdftotext` themselves — right now packets describe such files as "text-extracted" when they are
   not, which will mislead the next reader.
2. **Kobayashi-Ota is the critical path.** Castella-Hsieh Prop. 7.8 — and therefore Thm. 7.7,
   Thm. 6.1(1) and everything GH.6 exports — currently rests on a proof the authors have withdrawn.
   Assign Kobayashi-Ota Lemma 4.10, or restrict GH.2/GH.6 to the unramified range until it is read.
3. **BDP Thm. 5.13 is shared with GrossZagierAndArithmeticHeights GZ.9** (see §4 above). One
   roadmap should decompose it; the other should consume it.
4. **GH.3 has no node** although its coverage is `partial`: the universal-norm targets (LV
   Lemma 4.2, Prop. 4.5) are recorded only inside GH.5. If GH.3 is to own them, the next worker
   should move them.

---

### Questions and decisions for the orchestrator — 7. HeegnerPointEulerSystems.json (EXT-15)

1. **HE.8 / HE.8b are duplicates in the atlas.** Byte-identical descriptions, both declaring
   "Milestone: HE.8". Either write HE.8b's distinct scope or merge it; until then HE.8b cannot be
   decomposed without copying HE.8.
2. **Edge direction HE.8 ↔ HE.8c.** The atlas makes HE.8c a consumer of HE.8, but Cornut-Vatsal
   nonvanishing is an *input* to Theorem B. Decide whether HE.8c is a downstream "source
   hypotheses" note (then the input relation must be recorded inside HE.8's text) or an upstream
   supplier (then both existing edges must be reversed).
3. **Missing atlas edge GZ.8 → HE.8c** (endorsed above, acyclic). Add it, or rule that the
   Gross-Zagier input is consumed only through HE.3.
4. **Acquisitions, in priority order:** Gross's *Kolyvagin's work on modular elliptic curves* needs
   OCR (two load-bearing propositions); McCallum's Lemma 4.1 and Prop. 4.4 are quoted verbatim by
   Howard and are absent; Perrin-Riou [PR87] supplies both the alternative norm relation and the
   Prop. 10 used by Thm. 2.3.7; Kolyvagin, Kolyvagin-Logachev and Rubin's CM paper are catalogued
   with no file and block HE.7/HE.7s entirely.

---

### Questions and decisions for the orchestrator — 8. DeformationAndDerivedPatchingAlgebra.json (EXT-01)

1. **Missing atlas edge `DerivedDeRhamCohomology:DD.1 → P7`.** The atlas has P7 requiring only
   R03.1 and R03.3, but the packet (correctly) cites DD.1 for derived completeness and derived
   Nakayama, which DD.1's own stage text owns. Add the edge or move that dependency.
2. **Missing atlas edge `R03.4 → PotentialModularityAndCompatibleSystems:R24.1`.** The atlas routes
   R24.1 through R03.6, yet R24.1's text *is* KW II Theorem 10.1, whose finiteness criterion is the
   R03.4 node. Decide which stage supplies it.
3. **The Stacks book is outside the reference library** and unextracted. Either register it in
   `references/` with a text extraction or record in the protocol that packets may cite it from
   `upstream/`; otherwise every future reviewer repeats the 7641-page extraction.
4. **An abstract obstruction-theory relation bound is missing.** The packet's own R03.2 coverage
   says so: only the Galois instance (KW II Lemma 4.6) and ACC+'s variable count are decomposed.
   If the roadmap wants the general statement, it needs an owner and a source.

## REVIEW-EXT-03-review.md — last written 2026-09-16 02:55

### Questions for the orchestrator — 1. PadicDifferentialEquationsAndRigidCohomology.json (scope RD.2)

1. **RD.1 vs RD.2 placement.** The atlas RD.1 text owns "slope filtrations … existence/uniqueness
   and descent", but the packet files Theorem 1.2/6.10 under RD.2. Either move the node to RD.1
   (node id changes) or amend the stage texts. No other packet references the node id.
2. **R06.3 export form.** Confirm that RD.2 should export the logarithmic form (Theorem 6.13),
   since that is the form Berger's deduction consumes. The alternative is for R06.3 to cite
   André's Hasse–Arf paper, which is unread.
3. **Catalogue registration.** Kedlaya math/0110124v4 is not in `CATALOGUE.json`. The hash above
   is ready for registration. Tsuzuki, Amer. J. Math. 120 (1998), is needed for [T1, Thm 5.1.1].

---

### Questions for the orchestrator — 2. PadicHodgeTheory.json (scope R06.1 B_dR^+ part, P8:local-rational)

1. **R06.1 generality.** Should the R06.1 B_dR^+ node keep the (R, R^+) generality of Lemma 6.3
   with PerfectoidSpaces P1 as proof supplier, or restrict to (C, O_C) and import
   AInfCohomology:AI.0:integral? The atlas currently names only the latter.
2. **Atlas edges.** Add PerfectoidSpaces:P2 and P7 to P8:local-rational's `requires`, since
   Lemma 4.5 uses Sch12 Theorem 6.3(ii), Lemma 6.4 and Definition 7.14. Alternatively route them
   through P3.
3. **Relocation.** The Definition 4.1/Lemma 4.2 and Lemma 4.10 nodes remain relocation
   candidates for AInfCohomology:AI.3 (drafter's gap, unchanged).

---

### Questions for the orchestrator — 3. PerfectoidQuotients.json (scope Q0:integral-algebra, Q0:animated-application, Q2–Q4)

1. **Base change.** The base-change compatibility of perfectoidization needed by Theorem 7.4 has
   no non-circular source in BS22. Should Q2/Q4 carry an explicit reconstruction task, or should
   another source be sought (André's original, or Česnavičius–Scholze)?
2. **Integral perfectoidness.** Add BMS1 Lemma 3.20 as a Q0:integral-algebra node, or record it
   as a PerfectoidSpaces P1 export? The atlas says Q0:integral-algebra owns "relation to Tate
   perfectoid rings and integral subrings".
3. **Absolute prismatic site.** Should the orchestrator adopt a convention that the absolute
   prismatic site of a semiperfectoid ring allows unbounded prisms, or record the Proposition 7.2
   initial object as living outside Remark 4.7's bounded site?

---

### Questions for the orchestrator — 4. PerfectoidSpaces.json (scope P0, P1, P2, P3, P5, P7)

1. **P3/P5 stage texts.** Adjust them so that P3 states the henselian finite-étale approximation
   import (Sch12 Prop. 7.4 / Lemma 7.5) and P5 reuses it for ECD 6.4(i). A P5 → P3 link would be
   a cycle.
2. **Atlas edges.** Add AdicSpacesPartII:R3 → P2 (Tate acyclicity) and
   DerivedDeRhamCohomology:DD.0 → P1 (cotangent complex) to the stage `requires`, or route them
   through P0.
3. **Almost cotangent complex.** No stage owns the almost-context deformation theory (GR §2.5,
   §3.2) that Theorem 5.10 needs. DD.0 covers only the classical theory.

---

### Questions for the orchestrator — 5. TropicalAndBerkovichArithmetic.json (scope TB.2, TB.5)

1. **Catalogue.** Register both BPR papers (hashes above), and the other uncatalogued sources the
   coverage names (Chambert-Loir math/0304023 for TB.6).
2. **Atlas edge.** Either add TB.2 → TB.5 to the stage `requires`, or route the skeleton input
   through TB.3 as the atlas currently does.

---

### Question for the orchestrator — 6. WeightsInEtaleCohomology.json (scope R34.1, R34.5)

**Relocation.** The drafter's own finding stands: DWP.7 and DWP.8 own Theorems 3.3.1 and 3.4.1,
and their packets (EXT-02) do not exist. These four R34.5 nodes are records of what was read, not
a claim of ownership; when the DWP packets are written they should become links.

---

### Questions for the orchestrator — 7. WeilConjectures.json (scope WC.1, WC.2, WC.3, WC.6)

1. **Trace-formula owner.** Should SF.2 (the recorded integration owner) carry Grothendieck's trace
   formula as a stage, so that WC.1 and WC.2 can link to it instead of to an external id?
2. **Functional equation.** WC.2's exact functional equation has no source read in this packet;
   EDC.8's description promises the reciprocal-pairing interface. Which source should be assigned?
3. **Normalization.** Weil I and the SGA 4½ Rapport use different zeta normalizations (t over F_q
   versus T = t^f). One should be fixed campaign-wide before these nodes are consumed.

---

### Decisions the orchestrator must make — Summary of the review

1. **Stage-text corrections.** Three stage texts contradict the sources: P3/P5 (the henselian
   finite-étale approximation is consumed by P3's almost purity proof, not first by P5); RD.1/RD.2
   (the slope filtration theorem is RD.1 content but is filed under RD.2); P7 in PadicHodgeTheory
   (not a container stage).
2. **Atlas edges.** Nine packet edges have no atlas counterpart and are all acyclic; the most
   substantive are PerfectoidSpaces:P2 and P7 → PadicHodgeTheory:P8:local-rational,
   AdicSpacesPartII:R3 → PerfectoidSpaces:P2, DerivedDeRhamCohomology:DD.0 → PerfectoidSpaces:P1,
   and TropicalAndBerkovichArithmetic:TB.2 → TB.5.
3. **Supplier scope for A_inf/θ.** AInfCohomology:AI.0:integral covers only the field case, while
   PadicHodgeTheory R06.1's B_dR^+ node needs every perfectoid affinoid algebra. Either restrict the
   node or accept the new PerfectoidSpaces P1 suppliers.
4. **Unproved base change.** BS22 has no non-circular proof of the base-change compatibility of
   perfectoidization used inside Theorem 7.4. Decide whether Q2/Q4 carry a reconstruction task.
5. **Missing owners.** The almost-context cotangent complex (GR §2.5/§3.2), the trace formula
   (`UPSTREAM:CohomologicalPointCounting:TraceFormula`, owner SF.2 but no stage) and the functional
   equation have no stage to link to.
6. **Export forms.** RD.2 → R06.3 consumes the logarithmic form of the monodromy theorem (Kedlaya
   Theorem 6.13), not Theorem 1.1 as stated; and DWP.7/DWP.8 own the Weil II theorems recorded in
   the Weights packet.
7. **Catalogue.** Kedlaya math/0110124v4 and both Baker–Payne–Rabinoff papers are not in
   `CATALOGUE.json`; the hashes above are confirmed and ready for registration.

## REVIEW-EXT-05-EXT-02-review.md (reviewer still running; partial) — last written 2026-09-16 09:42

### Supplier questions for the orchestrator — 1. EXT-05 / GeometricSatakeAndFusion.json

- None arising from this packet: it contains no cross-roadmap links. The four
  reading boundaries it names (Zhu's mixed-characteristic Satake paper, BS17 §§2–7
  and 8.2–8.3, Keel §§1–2, FS IV.6–IV.7) remain open and are correctly recorded as
  gaps rather than as inputs.

---

### Supplier questions for the orchestrator — 2. EXT-05 / RelativeFarguesFontaine.json

1. **F4 scope.** Accept `F4 → RF2:untilts` as an analytic-estimate-only edge with the
   recorded limitation, or widen F4's stage text from `ℚ_p` to a general nonarchimedean
   local coefficient field `E`, or add the ramified relative estimate as an explicit
   obligation of RF2:untilts. (New stage edge either way; acyclic.)
2. **RF roadmap scope.** The packet flags that FS II.1.6–II.1.14 and II.1.22 (classical
   points of `Y_C`/`X_C`) correspond to no RelativeFarguesFontaine stage text and are
   decomposed in the `VectorBundlesAndIsocrystals` packet instead. Confirm that placement
   or extend an RF stage.

---

### Supplier questions for the orchestrator — 3. EXT-05 / VStackSheavesAndLisseCategories.json

None from this packet — it has no cross-roadmap links. Its recorded reading boundaries
(FS IV.3, the body of IV.4, IV.6, IV.7, V.3, VII.2–VII.5, and the proof of Condensed
Theorem 5.8) are correctly held as gaps rather than as inputs.

---

### Supplier questions for the orchestrator — 4. EXT-05 / VectorBundlesAndIsocrystals.json

1. **Fix one HN/slope convention in the roadmap text** and record the translation to the
   other two (FF18's concave `(deg, rg)` polygon; FS's convex `(rank, deg)` polygon;
   the two block normalizations for Dieudonné–Manin). Every downstream comparison of a
   Newton polygon with an HN polygon depends on this.
2. **Brauer invariant of `D_λ`.** The VB0 stage text makes `inv(D_λ)` an explicit
   obligation; nothing in the read sources computes it. Decide whether to source it from
   the campaign's own local-field/Brauer material or to read Serre, *Corps locaux*.

---

### Supplier questions for the orchestrator — 5. EXT-02 / AdicCoefficientsAndComparisons.json

1. **Promote `AdicCoefficientsAndComparisons`, `ClassicalAdicEtaleCohomology` and
   `AdicEtaleGeometry` together**, or re-point the five cross-packet links at stage ids.
   As written they are node→node references across packets in one job, which the protocol's
   packet format does not itself provide for.
2. **Huber Proposition 6.1.1 has no owner.** It is a named input to the proof of
   ECD 27.2 but no node in `ClassicalAdicEtaleCohomology`'s H5 covers it. Decide whether
   H5 should gain a 6.1.1 node or whether the finiteness input belongs elsewhere.

---

### Supplier questions for the orchestrator — 6. EXT-02 / AdicEtaleGeometry.json

1. **Re-parent or keep?** `A4/diamond-of-analytic-adic-space-and-etale-site-15-6` decomposes
   a D6-owned statement under an A4 parent. Either re-parent it to `DiamondsAndVStacks:D6`
   (which moves it out of this packet, since a packet concerns one roadmap) or keep it as
   a recorded endpoint. If it moves, the two `AdicCoefficientsAndComparisons` links that
   consume it must be re-pointed at D6.
2. **Stage-edge consequence.** `data/atlas.json` already lists
   `AdicCoefficientsAndComparisons:L1` among D6's consumers, so D6 → L1 exists; what does
   not exist is D6 → L3 / D6 → L4, which the re-pointing in (1) would require.

---

### Supplier questions for the orchestrator — 7. EXT-02 / AdicSpacesPartII.json

1. Accept the new stage edge `R2 → ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`
   (acyclic), or route the generic-fibre functor through `AdicSpacesPartII:F0`, which is
   what that stage currently requires.
2. **Conrad is not in the library.** The packet's hash is right and the paper is freely
   available from the author's site; consider adding it to `CATALOGUE.json` so future
   workers do not have to re-fetch it.

## REVIEW-EXT-10-EXT-07-review.md (reviewer still running; partial) — last written 2026-09-16 09:37

### Questions for the orchestrator — 1. AlgebraicModularFormsAndSerreWeights.json (R15.1–R15.6)

1. **Serre-weight dichotomy at p = 2.** Stage R15.4 demands "for p=2 prove that the classical
   weight is 2 exactly in the finite-flat case and 4 otherwise". No read source proves this
   whole statement. Edixhoven Prop. 8.2 covers the wild case. The irreducible and tame cases at
   p = 2 still need a written prolongation and descent argument over Z₂. Keep the gap, or assign
   a source.
2. **Ownership of Edixhoven Prop. 8.2.** Decide between `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`
   and R15.4. Also decide whether R07.1 should state Raynaud Cor. 2.2.3 and Thm 3.3.3 explicitly.
3. **Placement of Deligne–Serre Lemme 6.13.** Either move the node to R15.5 and link it to
   `AutomorphicGaloisRepresentations:R19.1`, or leave it without an outgoing edge.
4. **Edixhoven Thm 4.5.** Confirm with EXT-13 that `SerreWeightAndLevelOptimisation:R20.3`
   proves it and consumes the R15.4 recipe. Integrating the re-targeted link adds the stage
   edge R15.4 → R20.3.
5. **Correct the handoff.** EXT-10 HANDOFF correction 4 should read "open for level n ≥ 12".

---

### Questions for the orchestrator — 2. ArithmeticGaloisRepresentations.json (R01.1–R01.6, G7)

1. **Faltings node placement.** Move the Faltings-theorem node out of R01.6 (to the EXT-07 Faltings
   packet or R28), or cut it down to R01.6's own Tate-module API.
2. **HANDOFF correction 13.** It can be closed: the normalisation is established from Deligne's page
   images.
3. **R01.4 and oddness.** R01.4 asks for "odd, irreducible ⇒ absolutely irreducible" over a finite
   field in general. The only source read proves the decomposable case for ρ valued in GL₂(F_p)
   with det ρ = χ.

## cohomology-comparisons-handoff.md — last written 2026-09-15 22:14

### 5. Supplier requests and the AI.5 → CP.5 claim — CohomologyComparisons — source-reading handoff (assignment R3)

- **AInfCohomology:AI.5 → CP.5 (verified).** AI.5's description says it proves "the linear
  algebra controlling integral torsion under these specializations" and that CP.5 "states the
  resulting torsion inequalities and lattice-recovery applications uniformly, importing this
  proof"; CP.5's description says "From AI.5's BKF linear algebra prove ...". Both sides agree.
  Encoded as links from AI.5 to the CP.5/CP.2 application nodes for the Theorem 14.3 package
  (perfectness, φ, BKF cohomology, comparisons (i)–(iv)). The generic §4.2 lemma nodes are
  tagged "[Supplier material ...]" in their statements and should be re-homed into the
  AInfCohomology packet (AI.5; Prop. 4.13 to AI.2, whose description owns "torsion
  decompositions" and Fargues' equivalence). Node ids must start with the owner roadmap, so this
  is a move, not a relabel.
- **AInfCohomology:AI.2 → CP.5 (verified, new links).** Def. 4.22, Lemma 4.26, Thm 4.28,
  Remark 4.29 are AI.2's per its description; two links added.
- **Ownership conflict to resolve.** Prop. 13.21 is required by AI.5's Theorem 14.3 (BKF
  property) and by CP.2's Theorem 14.6(i), while AI.5 → CP.2 is an existing edge. The packet
  keeps Prop. 13.21 under CP.2 (per CP.2's text) and adds no node → AI.5 link; recommend
  re-homing it to CrystallineCohomology CR.3 (Berthelot–Ogus-type rational base change) or AI.4.
- **CrystallineCohomology:CR.3 → CP.2/CP.5 nodes (links added):** crystalline base change
  (Prop. 13.21; k → k̄; RΓ_crys ⊗^L k ≃ RΓ_dR(X_k)). The char-p Frobenius-isogeny step for
  smooth qcqs (non-proper) k-schemes is a gap; candidate CR.3:Frobenius-isogeny, scope unchecked.
- **PadicHodgeTheory:R06.2 → CP.5/CP.2 nodes (links added):** D_crys/D_dR formalism in
  Prop. 4.34 and the crystallinity conclusion.
- **No supplier found for Kisin's Theorem 4.4 and Prop. 4.34.** R07.4's description covers
  finite-flat/p-divisible-group classification only; AI.7 disclaims it; PR.7 refers to "R07's
  Kisin functor". No link added; recorded as the first gap.
- **No supplier found for Scholze's Theorem 5.1** (proper smooth rigid de Rham comparison),
  used for filtration compatibility and for Ξ = D_dR(V) ⊗ B_dR^+.

## cohomology-review.md — last written 2026-09-15 21:59

### Decisions for the orchestrator — Independent review R2 — integral-cohomology packets

1. **DD.2 stage text.** The atlas description of DerivedDeRhamCohomology:DD.2 says
   "comparison with the ordinary de Rham complex for smooth maps" without qualification.
   The source supports: uncompleted `dR_{B/A}≃Ω•_{B/A}` for smooth maps of Z/p^n-algebras
   (Corollary 3.10); `dR_{B/A}≃A` for all maps of Q-algebras (Corollary 2.5, Remark 3.12);
   and only an asserted Hodge-completed comparison in characteristic zero (Remark 2.6).
   The packet's DD.2 coverage entry records the needed qualification; the stage text
   itself is outside this review's editing scope.
2. **Perfect-prism supplier.** Confirm the re-pointing of the perfect-prism link from
   AInfCohomology:AI.0:integral to PerfectoidQuotients:Q0:integral-algebra, or add an
   explicit statement of "ker θ is generated by a nonzerodivisor; A_inf(R) is classically
   (p, ker θ)-complete" ([BMS18, §3, Lemma 3.10/Remark 3.11]) to whichever stage is meant
   to own general integral perfectoid rings.
3. **New cross-roadmap edge.** The Prismatic packet's link
   `DerivedDeRhamCohomology:DD.1 → PR.1/prismatic-structure-sheaf` (completed faithfully
   flat descent in the Corollary 3.12 proof) has no counterpart in the atlas: DD.1 is in
   PR.0's `requires` but not PR.1's. Integrating the packet therefore adds a DD.1 → PR.1
   stage edge (acyclic; checked against `stageEdges`), unless the orchestrator prefers to
   route the descent input through PR.0. All other cross-roadmap link sources are already
   in the consumer's parent-stage `requires`.

## eigenvariety-review.md — last written 2026-09-15 21:54

### The AdicSpacesPartII:R2 partial-supplier question (orchestrator decision) — 1. PadicFamilies.json (scope L2a, generic eigenvariety construction)

Corollary 4.3 imports Conrad Theorem A.1.2 (quasi-finite flat of constant degree ⇒
finite), whose proof needs Bosch–Lütkebohmert I Prop. 4.7 and §3.5 rig-points, II
Thm 5.2/Cor. 5.3 (flat and quasi-finite formal models) and the scheme Lemma A.1.4
(EGA IV_4 18.5.11(c)). R1's supplier assessment: no stage in `data/atlas.json`
supplies these in the needed generality. `AdicSpacesPartII:R2` constructs admissible
formal schemes, blow-ups and the generic-fibre functor but no flattening, quasi-finite
model or finiteness criterion; `AdicSpacesPartII:F0` restricts formal geometry to
Noetherian adic rings (excluding O_K for nondiscrete K); `AdicEtaleGeometry:A2`,
`ClassicalAdicEtaleCohomology:H1:henselian` and `SchemeAndStackFoundations:SF.1` are
the next-closest candidates. R1 kept the edge R2 → `constant-rank-finiteness` only as
an annotated partial-supplier edge and did not assert supply. **Decision needed:** keep
the annotated partial edge, drop it (policy forbids partial-supplier edges), or open a
new stage/gap owner for Bosch–Lütkebohmert formal-model finiteness.

### Open items in PadicFamilies (from the packet's gaps) — 1. PadicFamilies.json (scope L2a, generic eigenvariety construction)

Formal-model finiteness (above); the CUP text for Lemma 4.5; the complete modular
eigencurve proof (Coleman–Mazur now on disk, mostly unread); the coherent eigenmodule
sheaf and nonflat specialisation (Coleman–Mazur §7.1's q-expansion pairing is the
modular instance and does not exist for the generic machine); dense classical points
and unitary classicality, which are not inferred from the eigenpacket classification.

### 3. Items for the orchestrator — Independent review: eigenvariety machine packets

- Decide the AdicSpacesPartII:R2 partial-supplier edge (Section 1).
- Update the catalogue entry for Coleman–Mazur 1998 with the Internet Archive
  provenance recorded in PadicFamilies.json.
- Consider obtaining the CUP 2007 text of Buzzard's *Eigenvarieties* to check whether
  the Lemma 4.5 defects were corrected in print.
- Serre 1962 could be added to the reference catalogue with the provenance above.
