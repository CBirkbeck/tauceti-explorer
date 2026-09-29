# REV-RS-21 — review of the RS-21 restructuring (smooth local representations and GL₂ automorphic representations)

**Verdict: accepted, with ten corrections made in place.** Reviewer: Claude Code, session `cc-39fac3`, 29 September
2026. The proposal was written by Codex, session `codex-c83e7a`. This reviewer took no part in it.

The main decisions are sound:
- SmoothRepresentationsOfLocalGroups stays the general foundation.
- GL2AutomorphicRepresentationsAndTransfer becomes a Part II of the Tau Ceti ModularForms roadmap.

The corrections fix three things:
- two special cases that already have owners (ProfiniteCohomology Layer 0 and InductionRestriction Layer 0);
- an overlap with the sibling Part II AlgebraicModularFormsAndSerreWeights (R17.6);
- the double ownership of the Fourier transform.

They also add twelve links and correct four link reasons.

**What was read.**
- The family `RS-21.json`: two members, the anchor `tauceti:TauCetiRoadmap/ModularForms`, and 23 leads (14 pairs).
- The proposal (23 layers, 161 links, 38 owner records) and its report.
- Both member documents in full, and the anchor document with all 16 layers.
- Every supplier stage a narrowing names: ProfiniteCohomology L0–L1, EnhancedDerivedSheaves E1, ModularForms L2, L4,
  L5, L7, L8, L8G and L11, AdelicAlgebraicGroups AA.0 and AA.2, AutomorphicFormsOnReductiveGroups AF.0–AF.5,
  AutomorphicLFunctionsAndLocalFactors AL.0–AL.5, AutomorphicSpectralTheory AS.4, EndoscopicTransferAndUnitaryTrace
  Comparison ET.6, ReductiveGroupsPartII RG2.4, ArithmeticGaloisRepresentations R01.2–R01.3, QuadraticFormInvariants,
  ClassFieldTheory L14, and InductionRestriction L0, L3a and L7.
- The consumers of every changed layer.
- The sibling Part II documents AlgebraicModularFormsAndSerreWeights and ModularSymbolsPadicLFunctions.
- Every other restructuring with entries on these stages. RS-05, RS-06, RS-08, RS-12, RS-19, RS-24, RS-26 and RS-31
  are accepted; RS-04 and RS-11 are pending.

**Checks run.**
- `python3 scripts/check_restructure.py` reports `ok` on both the original and the corrected file.
- The atlas as `scripts/build.py` assembles it at origin/main `827fe453` (2840 stages, 7806 edges). On it:
  - all 161 original links join existing stages; none is a self-loop, and 36 were already edges;
  - the 161 links, the 12 added below and the atlas edges are acyclic together;
  - for every narrowed layer, I checked that each of its current consumers has an edge or link from a supplier.
- The pinned-library claims, at Mathlib `082e2d3` and Tau Ceti `f790474`. All fifteen declarations exist as the report
  describes, and its seven file hashes match. Examples:
  - `IsSmoothDiscrete` and `isSmoothDiscrete_iff_continuousSMul`, at
    `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean:254, :324`;
  - `iSup_fixedPoints_openNormal_eq_top`, at `ContCohomology/Discrete.lean:180`;
  - the Hecke carriers, at `Mathlib/NumberTheory/HeckeRing/Defs.lean:75–189`;
  - `Rep.ind` and `Rep.indResAdjunction`, at `Mathlib/RepresentationTheory/Induced.lean:102, :155`.

## 1. The extension and the anchor

- **The title.** "Modular forms — Hecke theory, newforms, and L-functions, Part II: GL₂ automorphic representations and
  transfer" uses the anchor's atlas title exactly, in the same form as the two accepted siblings from RS-06 and RS-08.
- **It starts where the anchor stops.** ModularForms Layer 2 says: "Its adelic reformulation is out of scope here: the
  automorphic-representations roadmap consumes the GL_n ring of (a)/(a′) and builds the convolution comparison on its
  own side." The link from Layer 2 to R16.1 is that hand-off.
- **Nothing the anchor plans is planned again.**
  - R16.6, R16.4 and R16.5 only compare with Layers 4, 5, 7 and 8, and R16.2's newvector theorem is local.
  - No R16/R17 stage re-plans the modular curve (Layers 10A–10C).
  - R17.2 is distinct from Layer 11. Layer 11 is the level-one trace formula by period polynomials, with no analytic
    input, and it defers the quaternionic formula to "a future roadmap (Hijikata's formula)". R17.2 specializes the
    adelic trace formulas.
  - The link from Layer 11 to R17.2 makes Layer 11 a comparison input, which is §15's rule for a general theory that
    subsumes a special case.
- **Siblings.** This is the third Part II of the same anchor. ModularSymbolsPadicLFunctions does not overlap R16/R17.
  AlgebraicModularFormsAndSerreWeights overlaps R17.6 only: see section 2.

## 2. Duplication

The fourteen evidence pairs are resolved as the report says, and I agree with each verdict. Four further overlaps
were missed and are now corrected:
- **SR.2 against InductionRestriction Layer 0.** For an open subgroup, compact induction is Mathlib's algebraic
  induction, with Frobenius reciprocity `Rep.indResAdjunction`. InductionRestriction Layer 0 owns "Transitivity of
  induction … Ind_T^G (Ind_S^T A) ≅ Ind_S^G A" for any group. By §15, SR.2 now cites that case and proves its
  closed-subgroup statements compatible with it (correction 2).
- **R17.6 against the sibling Part II.** R17.6 plans "the residual modularity witness and its transition to the
  weight≥2 formulation". AlgebraicModularFormsAndSerreWeights owns the tools:
  - R15.6: "Define residual modularity";
  - R15.3: "Hasse invariant … weight-change results … The cases p=2 and p=3 are explicit";
  - R15.5: "Deligne–Serre eigenvalue-lifting lemma … the possible need for a weight change".

  Yet none of them was an ancestor of R17.6. R17.6 is narrowed to construct the characteristic-two witness and apply
  them (correction 6).
- **AF.0 against SR.1.** AF.0 plans "finite-place locally constant compactly supported functions … finite Hecke
  action" with no SR prerequisite. A link SR.1 → AF.0 is added (correction 9).
- **R30.2 against SR.0:abelian-category.** R30.2 constructs "the smooth mod-p … categories for GL₂(Q_p)". Accepted
  RS-26 left the generic smooth category "outside-family imports to coordinate". R30.2 is added to the carrier
  record's `formerly` (correction 8).

**Two owner records conflicted.** Both "Schwartz-Bruhat carrier and Fourier transform" (owner AA.2) and "Fourier-Poisson
analytic input for zeta integrals" (owner AL.0) claimed the Fourier transform.
- AA.2 plans quotient measures, central-character sections, L² spaces and Tamagawa measures, and no Schwartz–Bruhat
  space.
- AL.0 plans "local Schwartz–Bruhat spaces … Fourier transforms … adelic Poisson summation".

The records now follow the documents (correction 7).

**All other owner records agree with the accepted proposals:**
- RS-05: SR.0:abelian-category, SR.0:derived-extension and SR.2's compact induction.
- RS-24: SR.4's Satake transform.
- RS-06: ModularForms Layers 4, 5, 8 and 8G; R01.2 and R01.3.
- RS-19 keeps ET.1, ET.3, ET.4 and ET.6; RS-31 owns RG2.4.

## 3. Nothing lost

**The narrowings.** Each keeps its specialised work. Two supplier lists were incomplete:
- **SR.0:abelian-category.** It named ProfiniteCohomology Layer 1 for "the profinite exhaustion". That theorem is
  Layer 0 ("every element is fixed by an open normal subgroup, so M = ⋃_U M^U"), and the pinned
  `iSup_fixedPoints_openNormal_eq_top` is in a file whose header says it implements Layer 0 (correction 1).
- **R16.4.** Its Q-case rational structure needs ModularForms Layer 8G's conjugate newforms (correction 5).

**Consumers.** Every consumer of a narrowed layer has an edge or link from the new supplier, with three exceptions:
- **ClassicalSerreModularity R33.1.** A later blueprint made it a consumer of R17.5. It splits soluble from nonsoluble
  projective images, so it gets InductionRestriction Layer 7, as RS-21 gave R17.5's other consumers.
- **R17.5 and R17.3.** They consume R16.5, R16.6 and R16.4 in their own text but had no edges from them:
  - R17.5: "Use R16's converse theorem";
  - R17.3: "strong multiplicity-one uniqueness statements and the effect on rational structures".
- **AL.5.** It plans "compatibility of conductor exponents, local test vectors and character twists" for the GL₂
  families, which uses R16.2's local newvectors.

All of these links are in correction 9.

**Consumers that need no new link.** RS-05, accepted after RS-21 was written, gave SR.0:abelian-category eight more
consumers: ES0, ES1:finite-ramification, ES4, ES5, HS1, HS3, VS4 and VS5. They use the smooth category, which
SR.0:abelian-category keeps, not ProfiniteCohomology's carrier.

## 4. Corrections made in `RS-21.result.json`

1. **SR.0:abelian-category:**
   - ProfiniteCohomology Layer 0 is added to `suppliedBy`;
   - `keeps` names Layer 0's exhaustion, Mathlib's `CatCenter` and Layer 1's closure properties;
   - the reason is corrected.
2. **SR.2:** keep → narrow, with supplier InductionRestriction Layer 0 and the open-subgroup identification in
   `keeps`.
3. **SR.4 `keeps`:** the anchor supplies the GL_n(Q_p) algebra only, and the general Satake transform stays here.
4. **R16.1 `keeps`:** "adelic/Schwartz-Bruhat" → "restricted-product and quotient-measure".
5. **R16.4:** ModularForms Layer 8G is added to `suppliedBy`, and conjugate newforms to `keeps`.
6. **R17.6:** keep → narrow, with suppliers R15.3, R15.5 and R15.6.
7. **Fourier-transform records:** the AA.2 record becomes AA.2's actual scope; AL.0 owns Schwartz–Bruhat spaces,
   Fourier transform and Poisson summation (formerly R16.1, R16.5); the AA.0 record is narrowed to restricted
   products and Haar measures.
8. **Other owner records:**
   - the ModularForms Layer 2 record is narrowed to the GL_n(Q_p) hand-off;
   - R30.2 is added to the smooth-carrier record's `formerly`, and AL.5 to the newvector record's `formerly`;
   - four new records: InductionRestriction Layer 0 (transitivity of induction), R15.3, R15.5, and ModularForms
     Layer 8G.
9. **Twelve links added, all acyclic:**
   - ProfiniteCohomology L0 → SR.0:abelian-category;
   - InductionRestriction L0 → SR.2;
   - SR.1 → AF.0;
   - InductionRestriction L7 → R33.1;
   - ModularForms L8G → R16.4;
   - R15.3, R15.5 and R15.6 → R17.6;
   - R16.5 → R17.5 and R16.6 → R17.5;
   - R16.4 → R17.3;
   - R16.2 → AL.5.
10. **Link reasons corrected:**
    - SR.0:derived-extension → HS3: HS3's complexes have integral coefficients, not complex ones.
    - SR.0:abelian-category → R30.2.
    - AA.0 → R16.1 and AA.2 → R16.1.

Result: 17 narrowed layers, 173 links and 42 owner records. The `review` object is added at the top level.

## 5. For the orchestrator

1. **Mechanical links.** About twenty "Direct component import formerly reached through …" links point at targets
   that use nothing from the named supplier, for example:
   - ModularForms L2 → AL.4, ET.6, GS4:classical-Satake-comparison, HS3 and VS4;
   - AA.0, AA.2, AF.0 and AF.2 → R16.2;
   - SR.2 and SR.5 → R18.3;
   - InductionRestriction L7 → HE.6 and R23.3.

   Each is implied through the narrowed layer, so none adds an ordering constraint. Accepted proposals have kept such
   links, so I left them in. Should they be pruned as a policy?
2. **R17.4 and R17.5 → ET.7a.** These links give rank-two base change and monomial induction one owner. They also make
   about twenty stages wait for the whole R16.1–R17.5 chain, Langlands–Tunnell included: AG2.1–AG2.7, ET.7/7a/7b,
   IG.5–IG.7, PA.0–PA.4 and TC.4. ET.7a's own proof does not use the rank-two results. Accept this cost, or move the
   m = 2 comparison to a consumer of both, such as ModularityAndLanglandsExtensions ML.5?
3. **Essential vectors.** AutomorphicCongruences L3 imports "essential vectors" from SmoothRepresentationsOfLocalGroups,
   but no SR stage plans them. Should SR.5 own them, or should L3 cite R16.2?
4. **Satake parameters.** ModularForms Layer 9's Satake parameters {α_p, β_p} are the GL₂(Q_p) case of SR.4's parameter
   dictionary, up to normalization. A comparison link Layer 9 → R16.6 would record this; I did not add it.
5. **If the pending RS-04 is accepted,** AF.3 owns cuspidal finite multiplicity. RS-21's "cuspidal spectral
   decomposition" record at AS.4 should then cover only the residual and continuous decomposition, and AF.3 should
   join R16.4's suppliers.
6. **The GL_n Whittaker expansion.** AL.3's "global unfolding for cuspidal data" needs it, and no stage owns it. R16.5
   keeps the GL₂ case.
7. **Pending Mathlib PRs.** The SR document cites Mathlib PRs 43087 and 43286 for Hecke modules, which are open and not
   at the pin. If they land, SR.1 must compare with them too.
8. **The report `RS-21.md` is not a deliverable of this job, so I left it unchanged.** Its counts (15 narrowings, 161
   links, 38 owners) and its SR.0 supplier description are superseded by the corrected JSON.
