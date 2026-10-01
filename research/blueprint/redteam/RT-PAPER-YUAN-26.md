# RT-PAPER-YUAN-26

Red team of the accepted extraction PAPER-YUAN-26: Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*,
Annals of Mathematics 203 (2026), 15–119. Issue #4027.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`codex-c83e7a`, `cc-fb70e5`);
- its review, REV-PAPER-YUAN-26 (`cc-d67081`).

**Result: 75 findings, 5 high, 34 medium and 36 low.**

## Method

**The source.** The author manuscript of 21 August 2024
(<http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf>) was re-downloaded on 2026-10-01. Its
SHA-256
is `b36f4860…a813e`, equal to the extraction's. arXiv 2108.05625v4 was used for comparison.

**The passes.** All 126 pages were read against the extraction in six parallel passes run by this session:
- §1–2 (pp. 3–39);
- §3 (pp. 39–59);
- §4.1–4.3 (pp. 59–76);
- §4.4–4.6 (pp. 76–101);
- Appendix A (pp. 101–126);
- the routes and statuses, against `data/atlas.json`, the new roadmaps, the accepted blueprints, other papers' accepted
  routes and the pinned libraries.

**Merging.** Each pass checked its findings at their evidence and recomputed the numerics. I merged findings reported
by two passes into one: the projective arithmetic intersection theory, the statuses of /3 and /76, the target of /1,
the /262–/266 clause, the route-11 brief, and /222 with /229.

**The high findings.** I re-verified all five at their evidence:
- Lemma 2.1 on pp. 25–26, against the relative Frobenius of an ordinary elliptic curve;
- /142 on pp. 76–77, where the claim is made for S = M_{g,N,Q};
- the M̄_g triple planning, against RT-AREA-etale/4 and the three routes;
- the sign of the Poincaré bundle, via Δ^*(Mumford bundle) = O(2θ).

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** PAPER-YUAN-26/29 (Lemma 2.1(1)); sourceIssues (no entry)

**Claim.** Lemma 2.1(1) is false as printed in positive characteristic, and item /29 copies it. 'Projective and flat
with geometrically connected fibres' does not make pi^*: Pic(S) -> Pic(X) injective, and the proof rests on exactly that
injectivity. The paper's own proof needs O_S -> pi_*O_X to be an isomorphism, for example universally, which holds when
the fibres are geometrically reduced as well as connected. The extraction recorded no source issue for it.

**Evidence.** Manuscript p.25: 'Lemma 2.1. Let k be either Z or a field. Let X and S be quasi-projective and flat
integral schemes over k. Let pi : X -> S be a projective and flat morphism over k with geometrically connected fibers.
Then ... (1) The canonical map pi^*: Pichat(S) -> Pichat(X) is injective.' Proof, p.26: 'By [BLR, §8.1, Prop. 4], pi^*:
Pic(S) -> Pic(X) is injective. Then (1) follows ...'. The same text is in arXiv v4 (checked by word-diff of pp.3–39).
Counterexample, checked by hand: take k = Fpbar and E an ordinary elliptic curve over k. Let E' be the curve with E'^(p)
= E, let F: E' -> E be the relative Frobenius (finite, flat, purely inseparable of degree p), and set X = E' x_k P^1 and
pi = F o pr_1. Then X and E are integral, quasi-projective and flat over k, and pi is projective and flat. Each fibre is
Spec(local Artinian ring) x P^1, which is geometrically connected; the generic fibre is P^1 over K(E'), and K(E') is
purely inseparable over K(E), so it is geometrically connected too. On Pic^0, F^* is the dual isogeny of F, i.e. the
Verschiebung, which is separable of degree p because E is ordinary. So some line bundle L of order p on E has pi^*L =
pr_1^*F^*L ≅ O_X. To keep the base strictly quasi-projective, restrict to E° = E minus a point. L|E° is still
nontrivial, because Pic(E°) = Pic(E)/Z·O(P) contains Pic^0(E). The model adelic bundle (E, L) is therefore nonzero in
Pichat(E°/k), while its pullback is the model bundle (X, O_X), which is trivial. Lemma 2.1(1) is used only once, at
p.39, for J x_S X -> J, a smooth family with geometrically integral fibres, so nothing downstream is affected.

**Fix.** Restate /29 with the extra hypothesis 'O_S -> pi_*O_X is an isomorphism universally (e.g. pi smooth, or fibres
geometrically reduced and connected)'. This covers every use in the paper: smooth relative curves, X x_S X, J x_S X and
abelian schemes. Add a sourceIssue E31: kind error; locator Lemma 2.1(1), pp.25–26; printed text as quoted; correction
as above; reason the Frobenius/Verschiebung counterexample; affects 'a stated result' (Lemma 2.1(1) itself, no
downstream use); known new; searched: arXiv v4 has the identical text.

### /2 — missing

**Where.** PAPER-YUAN-26/11, /20, /21, /22; route 8 brief; prerequisites; PAPER-YUAN-26 route 8 brief ('Extend the
existing arithmetic line-bundle theory'); items /4, /7, /20, /21

**Claim.** Nothing in the extraction or the atlas covers the projective-level theory that every adelic item is a limit
of. That theory is: hermitian line bundles and arithmetic divisors with continuous metrics on projective arithmetic
varieties; nef hermitian line bundles; arithmetic intersection numbers in arbitrary dimension; and the Deligne pairing
<L_1,...,L_{n+1}> for projective flat morphisms, algebraic and metrized. Route 8's brief says 'Extend the existing
arithmetic line-bundle theory' and imports R35.1. But R35.1 builds hermitian bundles only over arithmetic curves, GZ.2
only arithmetic surfaces, and SF.5 only geometric Chow-group intersection. No atlas stage mentions a Deligne pairing at
all. [GS], [Zha2], [Del] and [MG] are cited by the paper but absent from prerequisites. Also: The adelic intersection
pairing (/20) and the relative Deligne pairing (/21) are defined, in the paper's own words, as limits of the
intersection pairings and Deligne pairings of the projective case. The projective objects are neither items of this
extraction nor planned in the atlas in the needed generality: arithmetic Cartier divisors with Green functions,
integrable hermitian line bundles, arithmetic intersection numbers on projective arithmetic varieties of any dimension,
and the hermitian Deligne pairing. The brief calls this theory 'existing', but R35.1 covers only arithmetic curves and
GZ.2 only arithmetic surfaces. Meanwhile accepted Gross–Zagier Part II routes plan Gillet–Soulé arithmetic divisors,
arithmetic Chow groups and arithmetic degrees on higher-dimensional arithmetic stacks. So this foundation is either
unplanned or planned in a different Part II from the one that needs it most generally.

**Evidence.** p.19: 'In the arithmetic case (when k = Z), Pic(X) is the category of hermitian line bundles with
continuous metrics on X'. p.20: 'strongly nef if it is isomorphic ... to a limit of nef hermitian line bundles'. p.22:
'There is an intersection pairing ... defined as limits of the arithmetic (or geometric) intersection pairings of the
projective case' and 'There is a relative intersection pairing ... This is defined as the limit of the Deligne pairing'.
p.26: 'their underlying line bundles are canonically isomorphic by [MG, Prop. 5.2.1.a]'. References: [Del] 'Le
déterminant de la cohomologie', [GS] 'Arithmetic intersection theory', [MG] Muñoz García 'Fibrés d'intersection', [Zha2]
'Small points and adelic metrics'. Atlas data/atlas.json: R35.1 'Construct the hermitian line/vector bundles over
arithmetic curves'; GZ.2 'Admissible pairings on arithmetic surfaces'; SF.5 'Construct Chow groups ... intersection
products'. A regex search of every stage description for 'Deligne pairing|Deligne's pairing|determinant of
cohomology|Knudsen-Mumford' returns no stage. Also: ms p.22: 'There is an intersection pairing … defined as limits of
the arithmetic (or geometric) intersection pairings of the projective case … This is defined as the limit of the Deligne
pairing.' R35.1 (README.md:28): 'Construct the hermitian line/vector bundles over arithmetic curves'. GZ.2
(README.md:40): 'For a smooth proper geometrically connected curve over a number field, construct the arithmetic
intersection pairing'. ANDREATTA-GOREN-HOWARD-ETAL-18/arithmetic-divisor → GSpinSpecialDivisorHeights: 'An arithmetic
divisor on M is a pair Ẑ = (Z, Φ) … ĈH¹(M) = Div^(M)/principal (Gillet–Soulé)'. SHANKAR-SHANKAR-TANG-ETAL-22/32 →
GSpinSpecialDivisorHeights: 'CĤ¹(M)_Q is the Gillet–Soulé arithmetic Chow group'. LI-ZHANG-22-B/115 →
UnitaryKudlaRapoportCycles: 'Arithmetic degrees and the Gillet–Soulé arithmetic Chow group'. All are accepted part-ii
routes with parent GrossZagierAndArithmeticHeights.

**Fix.** Add the following items. (a) Hermitian line bundles with continuous metrics, and arithmetic divisors with
continuous Green functions, on projective arithmetic varieties ([GS], [Zha2]). (b) Nef hermitian line bundle on a
projective arithmetic variety: semipositive metric and nonnegative height on every closed integral 1-dimensional
subscheme ([Zha2]); geometric case ordinary nefness. (c) Arithmetic intersection numbers of integrable continuous
hermitian line bundles on projective arithmetic varieties ([GS], [Zha2]); the geometric case may cite SF.5. (d) The
Deligne pairing of line bundles for a projective flat f: X -> Y with Y normal, together with its multilinearity,
symmetry, base change, the projection formula and <O(D),L_2,...> ≅ N_{D/Y}(L_2,...) ([Del], [MG]). (e) The metrized
Deligne pairing for continuous integrable metrics ([Zha2]). Route (a)–(e) to route 8, or to a separate Part II of
ArakelovGeometryAndAbelianHeights. Rewrite route 8's brief so that it builds these rather than 'extends the existing'
theory. Add [GS], [Zha2], [Del] and [MG] to prerequisites. Also: Add missing items for (a) arithmetic divisors and
hermitian line bundles with continuous or integrable metrics on projective arithmetic varieties, and their arithmetic
intersection numbers (Gillet–Soulé; Zhang 1995 for integrable metrics), and (b) the hermitian Deligne pairing for
projective flat morphisms, all as inputs of [YZ2] §4.1. Route them to ArakelovGeometryAndAbelianHeightsPartII as the
single most general owner. Change the brief from 'Extend the existing arithmetic line-bundle theory' to 'Construct the
projective arithmetic intersection theory and its Deligne pairing, then extend it'. Add a note for the maintainer that
the Gross–Zagier Part II items (ANDREATTA-GOREN-HOWARD-ETAL-18/arithmetic-divisor, SHANKAR-SHANKAR-TANG-ETAL-22/32,
LI-ZHANG-22-B/115) import Div^/Pic^/ĈH¹ from it, or the reverse, decided once.

### /3 — error

**Where.** PAPER-YUAN-26/142

**Claim.** The item states the §4.4.1 claim for an arbitrary family 'with maximal variation' over 'a quasi-projective
flat normal integral k-scheme' S. The paper proves it only for S = M_{g,N,Q}, and in the stated generality it is false.
The Noetherian induction ('Apply the open bound on each irreducible closed subvariety using Theorem4.5(4)') needs
Theorem 4.5(4)'s hypothesis that T -> S -> M_{g,k} is generically finite for EVERY closed subvariety Y of J. That holds
for every Y exactly when S -> M_g is quasi-finite, as it is for M_{g,N} -> M_g (a finite quotient map). Maximal
variation (generic finiteness) does not give it. Counterexample: let S be the blow-up of M_{g,N,Q} at a Q-point, with
exceptional divisor E of dimension 3g-4 >= 2. S is smooth, quasi-projective and birational to M_{g,N}, so it has maximal
variation. But X|_E = C_0 x E is constant, so J|_E = J_0 x E and Theta-bar|_{J_E} is pulled back from J_0. Take M =
Theta-bar + pi_J^*A with A ample on a compactification of S, fix x_0 in C_0(Qbar), and let y_e = (e, omega - (2g-2)x_0)
in J_E. Then h_L(y_e,x) = 2(2g-2)^2 hhat(x - x_0) does not depend on e, while h_M(y_e) >= h_A(e) - C is unbounded on
E(Qbar). Once c1 h_M(y_e) exceeds 2(2g-2)^2 times the essential minimum of C_0, the set {x : h_L <= c1 h_M(y_e)} is
Zariski dense in C_0 and hence infinite. So no c2 exists.

**Evidence.** p.76: 'Set S = M_{g,N,Q} and let pi : X -> S be the universal curve.' p.77: 'it suffices to prove that,
for any (non-empty) closed subvariety Y of J, there is a non-empty open subvariety V of Y ... This is again a
consequence of Theorem 4.2, applied to the base change X_Y -> Y ... Here the potential bigness condition is obtained by
Theorem 4.5(4).' p.69, Theorem 4.5(4): 'Denote by T the image of Y -> S. Assume that the composition T -> S -> M_{g,k}
is generically finite.' Item /142: 'S a quasi-projective flat normal integral k-scheme, and pi:X->S ... with maximal
variation ... for every adelic M on J/Z there are c1,c2>0 such that all y in J(Kbar) satisfy #{...} <= c2'.

**Fix.** Restate /142 for S = M_{g,N,Q} with N >= 3, the universal curve and its relative Jacobian, as the paper does.
More generally it may be stated for any S whose moduli morphism S -> M_g is quasi-finite, but not merely generically
finite. Record the input that makes Theorem 4.5(4) apply to every closed subvariety: M_{g,N} -> M_g is finite. Add it to
/85 or as its own item, routed with /142. The same restriction to fine level-N moduli belongs in the shared preamble of
/143 and /145, which are only used for S = M_{g,N}.

### /4 — error

**Where.** PAPER-YUAN-26/213, /214, /215 (shared preamble of /211-/216); inherited by /53-/65 (Theta =
Delta_J^*(P^vee)); sourceIssues (no entry); route 8 brief (JacobianChallengePartII)

**Claim.** The items define P as 'the Poincare bundle on J×J via its principal polarization'. With the standard
normalization (1×phi_L)^*P_{A×A^vee} = m^*L ⊗ p1^*L^{-1} ⊗ p2^*L^{-1}, a principal polarization phi_theta gives P =
m^*O(theta) ⊗ p1'^*O(-theta) ⊗ p2'^*O(-theta), which is the INVERSE of the bundle in Theorem A.3(2). Under the items'
own stated convention, /213, /214 and /215 are false: each holds for P^{-1}. The paper's formulas (A.3(2)-(4) and
Definition 2.4's ampleness claim) are consistent only with P = (1 × (-phi_theta))^*P_univ, the Poincare bundle for the
Abel–Jacobi identification J ≅ J^vee inverse to i_alpha^*. That contradicts the paper's own description on p.30 ('via
the polarization'). The extraction neither records this sign conflict as a source issue nor fixes the convention in the
items.

**Evidence.** p.110, Theorem A.3: 'Denote by P the Poincaré line bundle on J × J ... (2) P = m^*O(−θα) ⊗ p′1^*O(θα) ⊗
p′2^*O(θα) ... (3) (iα, iα)^*P = O(∆) − p1^*α − p2^*α'. p.111: '(4) ∆J^*P = O(−(θα + [−1]^*θα))'. p.30: 'there is still
a canonical principal polarization J → J∨ ... we have a Poincaré line bundle P on J ×S J, obtained by the Poincaré line
bundle of J ×S J∨ via the polarization ... Definition 2.4. Θ = ∆J^*(P∨) ... This is the construction outlined right
before [MFK, §6.2, Prop. 6.10] ... By Theorem A.3(4) ... Θ is relatively ample'. Checks I did: (i) restricting A.3(2) to
{a}×J and pulling back by i_alpha, using i_alpha^*O(theta_alpha) = omega+(2-g)alpha (A.3(1)) and
i_alpha^*t_a^*O(theta_alpha) = omega-(g-2)alpha-a, gives (id,i_alpha)^*P|_{{a}×C} ≅ a. (ii) By contrast,
i_alpha^*phi_theta(a) = i_alpha^*(t_a^*O(theta) ⊗ O(-theta)) ≅ -a. For g=1 and alpha=O: phi_{O(O)}(a) = O([-a]-[O]) ~
-([a]-[O]), the standard i^*∘phi_Theta = -1. (iii) With P = Lambda(theta), Delta_J^*P = [2]^*O(theta) ⊗ O(-2theta) =
O(theta + [-1]^*theta), using A.3's own [2]^*O(theta) = O(3theta+[-1]^*theta). That is ample, so Delta_J^*(P^vee) would
be anti-ample, against p.30. Identical text in arXiv v4 (pp.29-30, 109-110).

**Fix.** In the preamble of /211-/216, define P := m^*O(-theta_alpha) ⊗ p1'^*O(theta_alpha) ⊗ p2'^*O(theta_alpha),
equivalently (1 × (-phi_{theta_alpha}))^*P_{J×J^vee}: the rigidified bundle with (id,i_alpha)^*P|_{{a}×C} ≅ a, i.e. the
Poincare bundle for the identification J ≅ J^vee inverse to i_alpha^*. Say that this is minus the principal
polarization. In /53-/65 replace 'pulled back along the canonical principal polarization' by 'pulled back along minus
the canonical principal polarization (so that Theta is ample)'; equivalently, keep the polarization and set Theta :=
Delta_J^*P. Add source issue E31 (misprint/sign convention): '§2.2.1 p.30 says P is obtained via the polarization, but
Theorem A.3(2),(4) (pp.110-111) and the ampleness of Theta = Delta_J^*(P^vee) need P via minus the polarization; affects
nothing once the convention is fixed'. Require route 8's brief to fix this sign.

### /5 — duplicate

**Where.** PAPER-YUAN-26 route 10 (part-ii StableReductionPartII): brief, items /69, /70, /250, /251, /252, /82-/85

**Claim.** The construction of M_g ⊂ M̄_g (smooth proper Deligne–Mumford stacks over Z with normal-crossings boundary
and universal curve) is planned under three different owners by three accepted routes: this route
(StableReductionPartII, unpointed g>1), PAPER-CANNING-LARSON-PAYNE-24 route 1 (new roadmap
MotivicStructuresInModuliOfCurves) and PAPER-LANDESMAN-LITT-24 route 5 (source of AlgebraicModuliForArithmeticGeometry
R09.4/R09.5/R09.7). The confirmed red-team finding RT-AREA-etale/4 chose StableReductionPartII as the single owner and
wrote the edits, but none is applied: route 10's brief still plans only the unpointed g>1 range, and the other two
routes still construct M̄_{g,n} themselves.

**Evidence.** Route 10 brief (current file): 'Construct M_g, barM_g and their universal curves for g>1 over Z.' No
'Pointed range (FIX-RT-AREA-etale /4 …)' paragraph is present. CANNING-LARSON-PAYNE-24/2 (route 1, new
MotivicStructuresInModuliOfCurves, review accept): 'M̄_{g,n} is a smooth proper Deligne–Mumford stack over the integers
of dimension d_{g,n} = 3g − 3 + n'. LANDESMAN-LITT-24/106 (route 5 → R09.4, R09.5, R09.7, review accept): 'The moduli
stack M_{g,n} … is a smooth separated Deligne–Mumford stack … with a Deligne–Mumford compactification M̄_{g,n} … whose
boundary is a normal crossings divisor'. research/blueprint/redteam/RT-AREA-etale.review.json, RT-AREA-etale/4:
'confirmed … Extend StableReductionPartII to the stable pointed range 2g−2+n>0'. RT-AREA-etale.fixes.md, '/4 … Edit 1:
PAPER-YUAN-26 route 10, field brief … Append: Pointed range …' and Edits 2-3 for LL/106 and CLP/2. queue.json has both
DESIGN-StableReductionPartII and DESIGN-MotivicStructuresInModuliOfCurves pending.

**Fix.** Apply RT-AREA-etale.fixes.md Edit 1 verbatim to PAPER-YUAN-26 route 10 'brief' (Knudsen M̄_{g,n} for 2g−2+n>0
with Theorem 2.7, de Jong 2.24 projective covers for n≥3, the compactification-after-alteration theorem, M̄_{g,n} placed
in a stage that needs no Torelli, ShimuraCompactifications C5 or JacobianChallengePartII input, consumers
L5:alterations, LANDESMAN-LITT-24/106 and MotivicStructuresInModuliOfCurves). Apply Edits 2 and 3 in the same change so
that LANDESMAN-LITT-24/106 and CANNING-LARSON-PAYNE-24/2 import M̄_{g,n} from StableReductionPartII instead of
constructing it.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | PAPER-YUAN-26/29 (Lemma 2.1(1)); sourceIssues (no entry) | Lemma 2.1(1) is false as printed in positive characteristic, and item /29 copies it. 'Projective and flat with geometrically connected fibres' does not make … |
| /2 | high | missing | PAPER-YUAN-26/11, /20, /21, /22; route 8 brief; prerequisites; … | Nothing in the extraction or the atlas covers the projective-level theory that every adelic item is a limit of. That theory is: hermitian line bundles and … |
| /3 | high | error | PAPER-YUAN-26/142 | The item states the §4.4.1 claim for an arbitrary family 'with maximal variation' over 'a quasi-projective flat normal integral k-scheme' S. The paper proves … |
| /4 | high | error | PAPER-YUAN-26/213, /214, /215 (shared preamble of /211-/216); … | The items define P as 'the Poincare bundle on J×J via its principal polarization'. With the standard normalization (1×phi_L)^*P_{A×A^vee} = m^*L ⊗ p1^*L^{-1} ⊗ … |
| /5 | high | duplicate | PAPER-YUAN-26 route 10 (part-ii StableReductionPartII): brief, items … | The construction of M_g ⊂ M̄_g (smooth proper Deligne–Mumford stacks over Z with normal-crossings boundary and universal curve) is planned under three … |
| /6 | medium | missing | §2.1–§2.3 (no item); notes of /34, /239, /240 | Several functoriality results have no item although the proofs depend on them. (i) The pullback functor f^*: Pichat(V/k) -> Pichat(U/k), and its preservation … |
| /7 | medium | missing | Lemma 2.1(2) proof p.26, Proposition 2.7(1) proof p.34, Theorem … | The Yuan–Zhang integration formula drives three proofs in §2 and has no item. It says that an integrable adelic L on X/k induces, for each v ∈ S^an, an … |
| /8 | medium | missing | §2.2.1 pp.29–30, §2.3 pp.38–39; route 9 (JacobianChallengePartII) | No item constructs the objects that /39, /40 and /244–/247 take as given. These are: the relative Jacobian J = Pic^0_{X/S} as an abelian scheme for a smooth … |
| /9 | medium | library-claim | PAPER-YUAN-26/3 (and /238); PAPER-YUAN-26/3 'Relative powers' … | /3 (relative powers X^m_{/S}, with X^0 = S) is marked 'planned' at JacobianChallenge Layers A and C. Neither layer plans fibre powers, and Mathlib already has … |
| /10 | medium | error | PAPER-YUAN-26/241, /35, /36, /37, /38 (and the dependent /46, /48, … | These items still state Theorem 2.3 and its consequences for g > 0, although the extraction's own confirmed E8 records the g = 1 case as unproved. /241 asserts … |
| /11 | medium | missing | sourceIssues (no entry for §3.1.4); PAPER-YUAN-26/83 note; … | The paper's sketch for the existence of stable compactifications is wrong as printed, and the extraction corrected it silently instead of recording a … |
| /12 | medium | error | PAPER-YUAN-26/112 | /112 does not use the E6-corrected statement, as PROTOCOL §18 requires ('Items and nodes use the corrected statements'). Its hypothesis 'If phi≥c0>0' is either … |
| /13 | medium | error | PAPER-YUAN-26/89, PAPER-YUAN-26/88 | The two cited YZ2 lemmas are restricted to trivially valued fields. /89 also carries the curve family and its stable compactification, which have nothing to do … |
| /14 | medium | error | PAPER-YUAN-26/76 (status 'planned', … | Status overstated. /76 asserts representability of Pic^0_{X/S} as a semi-abelian scheme for a stable curve over an arbitrary integral noetherian S. The paper … |
| /15 | medium | error | PAPER-YUAN-26/258 | The clause 'its restriction on smooth curves is finite' is false under its natural reading, that M_g → A_g (or Ā_g) is a finite morphism. That map is not … |
| /16 | medium | missing | items (none); used by /67, /68, /105, /107, /112 | No item records the basic positivity facts of adelic intersection theory that §3's main proofs use. (a) The mixed intersection numbers of nef adelic bundles … |
| /17 | medium | missing | items (none for ω_a, ⟨ω_a,ω_a⟩ and Φ_S; /163 is the analogue for … | No item states that the canonical admissible bundles, their Deligne pairing and Φ_S are compatible with base change, and §3 uses this three times. (i) For a … |
| /18 | medium | error | sourceIssues PAPER-YUAN-26/E21 (correction, affects, locator and … | E21's correction ('a strict inequality ...; equivalently halve epsilon in the claim') and the review's reason ('Since epsilon is an arbitrary positive rational … |
| /19 | medium | error | PAPER-YUAN-26/130 (status, planned) and route 11 … | /130 is 'missing' with no planned layer, but the atlas already plans most of it. (a) The Tate-limit canonical height hhat_Theta(P)=lim 4^{-n} h_Theta([2]^n P) … |
| /20 | medium | missing | items for §4.1.2 (after /118); used by /119, /120 and /143 | No item states the functoriality and additivity of the normalized adelic height h_L of §4.1.2. Yet the proof of Theorem 4.2 calls the resulting identity … |
| /21 | medium | missing | §4.4.2 (pp.79-81); no item (cf. PAPER-YUAN-26/142, /145) | The function-field half of the proof of Theorem 4.7 has no item. /142 is explicitly 'Over number fields' and /145 only bounds deg(M/y) from below. Two things … |
| /22 | medium | missing | §4.4.3, p.84; no item (cf. PAPER-YUAN-26/147, /149) | The uniformity argument relies on a variant of Theorem 4.10 over F_p for the finitely many characteristics dividing N'. The paper asserts this variant and … |
| /23 | medium | error | PAPER-YUAN-26/262, /263, /264, /265, /266; PAPER-YUAN-26 items /262, … | All five corrected function-field statements of Theorem 4.19 still define their hypothesis with the clause '(equivalently, the family is not isotrivial after … |
| /24 | medium | other | routes: HeightsRationalPointsAndObstructionsPartII, field 'brief'; … | The design job's brief contradicts its route. It says the function-field branches of Theorem 4.19 are excluded and asks only for the number-field branches. Yet … |
| /25 | medium | missing | §4.6.1-§4.6.4 (pp.96-101); proofs of Theorem 4.17(4),(5) and Theorem … | The equivalences (2)<=>(4) and (3)<=>(5) use three facts that no item carries. (i) The canonical adelic extension L-bar with [2]^*L-bar = 4L-bar of a … |
| /26 | medium | error | PAPER-YUAN-26/221 (and /222, which needs g_mu(x,.) in F(Gamma)) | /221 defines F(Gamma), for a graph 'with finite vertex subdivision', as continuous functions 'C^2 on each open edge'. That reads as a fixed vertex set. But the … |
| /27 | medium | library-claim | PAPER-YUAN-26/221 (planned TB.3); /227, /228, /230 (planned TB.6) | TB.3 plans the Laplacian only of piecewise integral-affine functions. It does not plan Zhang's Laplacian on piecewise-C^2 functions, with its -f''dx term and … |
| /28 | medium | library-claim | PAPER-YUAN-26/229 (planned GZ.2); PAPER-YUAN-26/222 and /229 (planned … | /229 identifies the Berkovich measure dmu_a on C^an, which /205 defines through admissible metrics on the Jacobian, with i_* of Zhang's graph measure. It does … |
| /29 | medium | missing | Appendix A, p.117 (no item); used by /229, /90, /91, /155, /260 | No item defines the effective resistance r(x,y) of a metrized graph, or the edge resistance r_e in Gamma minus the open edge. Proposition A.5 (/229), Lemma 3.5 … |
| /30 | medium | missing | Appendix A, pp.109, 111, 118 (no item); needed by /229 and by Theorem … | No item says that the Zhang metrics of Theorem A.1 are admissible, i.e. that c1(O(x),//.//_x) = dmu_a and c1(omega,//.//_a) = (2g-2)dmu_a. /197 states only … |
| /31 | medium | missing | Appendix A, pp.113-114 (no item); inputs of /218 and /219 | The existence proof of Theorem A.1 rests on four local tools. (a) The Deligne pairing of continuously metrized line bundles on Berkovich curves over a single … |
| /32 | medium | error | prerequisites | Two papers that Appendix A builds on, and that the atlas does not cover, are missing from the prerequisite list. Heinz [Hei] is the source of the … |
| /33 | medium | other | routes[7] (ArakelovGeometryAndAbelianHeightsPartII) brief | Route 7 receives /196-/199, /201-/208, /210, /217-/219, /224-/226 and /232-/234, the whole local theory of Appendix A. Yet its brief never states Theorem A.1 … |
| /34 | medium | error | PAPER-YUAN-26 route 12 (source ArakelovGeometryAndAbelianHeights … | Wrong owner. The finiteness the item needs, namely Northcott for Faltings heights of semistable abelian varieties and the passage from moduli points to … |
| /35 | medium | duplicate | PAPER-YUAN-26 item /144 (route 8, … | Bost's lower bound for the Faltings height is already routed by an accepted route to ArakelovGeometryAndAbelianHeights (R35.1–R35.6). This extraction routes it … |
| /36 | medium | duplicate | PAPER-YUAN-26 item /259 (route 11, … | Accepted source routes already make HeightsRationalPointsAndObstructions RP.0 the owner of the Weil height and the Néron–Tate height over a one-variable … |
| /37 | medium | duplicate | PAPER-YUAN-26 items /175, /176 (route 9, JacobianChallengePartII) | The curve-family Faltings–Zhang morphism X^{m+1}_{/S}→J^m_{/S} has two different owners. DIMITROV-GAO-HABEGGER-21 routes D_M on an abelian variety to RP.5 and … |
| /38 | medium | duplicate | PAPER-YUAN-26 items /171-/174, /177-/181 and route 11 brief | Non-degeneracy of subvarieties of abelian schemes (the Betti map, Betti form, the Betti-rank definition, Gao's non-degeneracy of D_M(C_S^{[M+1]}) and Gao's … |
| /39 | medium | duplicate | PAPER-YUAN-26 items /244, /245, /246 (and the twice-theta part of … | The symmetric, zero-rigidified, relatively ample twice-polarisation bundle (1,λ)^*P^∨ of a principally polarised abelian scheme is already a source target of … |
| /40 | low | other | sourceIssues PAPER-YUAN-26/E10 (review verdict 'confirmed') | E10's verdict should be 'rejected'. The sentence at p.29 is not a wrong label target. The §2.2.1 constructions over a noetherian base, specialized to S = Spec … |
| /41 | low | error | source.version; gaps['theorem-4-19-published-wording']; sourceIssues … | Three places in the file say that the §1.6 definition of maximal variation is word for word the same in arXiv v4 and in the 21 August 2024 manuscript. It is … |
| /42 | low | error | PAPER-YUAN-26/272, /273, /277 (locators) | Three locators are off by a page. Ullmo's Bogomolov statement (/272) runs over pp.3–4, with its content on p.4. The SUZ citation (/273) is on p.4, not p.3. The … |
| /43 | low | missing | §1.5 pp.14–15, §1.1 p.5 (no item); /273, /276 | The extraction itemized §1.1's cited results (/272–/277) but not the parallel ones stated in §1.5. These are Zhang's equivalence 'Bogomolov for C ⟺ omega_a^2 > … |
| /44 | low | missing | §1.6 p.16; §2.2 p.29; §2.3 p.33 (no item) | Three basic notions the paper defines or cites have no item. 'Variety over k' (integral, separated, finite type) is library-composable. 'Curve over a field' … |
| /45 | low | error | PAPER-YUAN-26/1 (planned target); PAPER-YUAN-26/1 (planned: … | /1, Yuan's general relative curve, is planned at StableReduction Layer 3, which defines only prestable families, i.e. nodal ones. Yuan's definition has no … |
| /46 | low | error | PAPER-YUAN-26/169 | /169 says only 'Brackets divide by [K:Q] only in the number-field case'. It omits the paper's function-field normalization, under which omega^2 is computed … |
| /47 | low | missing | sourceIssues (no entry for p.52); items /99, /253–/255 | The paper cites the wrong part of [YZ2, Lem. 4.6.1] for the composition formula in the proof of Theorem 3.6. In the cited version [YZ2] v6, Lemma 4.6.1(1) is … |
| /48 | low | missing | sourceIssues (no entry for the proof of Theorem 3.10); items /85, /110 | The proof of Theorem 3.10 applies Theorem 3.7, which requires an integral base, to M_C = M_{g,N,Q} ⊗_Q C. This scheme is not integral: for N ≥ 3 it has φ(N) ≥ … |
| /49 | low | missing | items (none for Remark 3.9) | Remark 3.9 asserts an improved constant in Theorem 3.8, namely 1/12 in place of 3/(5(2g−1)(3g−1)), by the LSW/Wilms method combined with the Carney (YZ3) Hodge … |
| /50 | low | missing | PAPER-YUAN-26/84, PAPER-YUAN-26/85 | Separately cited theorems are bundled into single items, against PROTOCOL §16 ('A result the paper cites from elsewhere is one item'; 'Split multi-part … |
| /51 | low | error | PAPER-YUAN-26/104 | The item misstates the paper's open question. The paper asks whether L is nef in general, but asks about bigness only for families with maximal variation and a … |
| /52 | low | error | PAPER-YUAN-26/97 | The item does not apply the confirmed E2 correction: it gives the Green function as 'integral log//1//_{Delta,a} c1(O(Delta)_a)^2' with no domain. The domain … |
| /53 | low | other | PAPER-YUAN-26/127 (Theorem 4.5(4)); /106; new sourceIssue | The proof of Theorem 4.5(4) obtains potential bigness over Y from Theorem 4.1. But Y, and its replacement by the Zariski closure of the image in J, need not be … |
| /54 | low | other | sourceIssues (new); item /114 | The paper's proof that Y^m_{/S} is irreducible gives a non-sequitur reason. 'Equi-dimensional with irreducible generic fibre' does not imply irreducible. … |
| /55 | low | other | sourceIssues (new); item /136 (Lemma 4.8 (c)⇒(b)) | The proof of (c)⇒(b) assumes that the descended degree-0 class has the form (2g-2)alpha_0 - d omega_{C0} for some alpha_0 ∈ Pic^d(C0). Descent of the degree-0 … |
| /56 | low | other | sourceIssues (new); item /141 | Lemma 4.9's proof defines K' as 'the smallest subfield of Kbar such that all points of J(Kbar)[N] are defined over K''. This field need not contain K, and the … |
| /57 | low | error | PAPER-YUAN-26/113 (and its use by /119, /120, /142) | /113 defines potential bigness only for S quasi-projective, flat, normal and integral over k, following p.59. But Theorem 4.2 (/119, /120) applies the notion … |
| /58 | low | library-claim | PAPER-YUAN-26/129 (note) | The note says only that 'the pinned relative projective height alone is insufficient'. It omits that pinned Mathlib already has the absolute … |
| /59 | low | error | PAPER-YUAN-26/E1 (fields 'reason' and 'correction'; review verdict) | The verdict 'confirmed' is right, but the recorded counterexample is wrong as written. It takes 'alpha any line bundle of positive degree' on the constant … |
| /60 | low | other | PAPER-YUAN-26/185, /186, /187, /188, /189 (field 'note') | The notes are stale. They say the function-field branch is 'separated and left unresolved', which contradicts the current state: /262-/266 now carry the … |
| /61 | low | error | PAPER-YUAN-26/147 | The item quantifies over 'every K/k of transcendence degree one'. The theorem is about function fields of one variable, which are finitely generated of … |
| /62 | low | error | PAPER-YUAN-26/146 | The gloss 'For a k-scheme this corresponds to a dimension-one moduli image' is imprecise. For a k-morphism into a finite-type k-scheme U, non-isotriviality … |
| /63 | low | missing | Remark 4.15(1), p.96; no item | Remark 4.15(1), Bost's arithmetic slope inequality [Bos1, Thm. IV] and the alternative proof of Theorem 4.14(b) through it, has no item. Its geometric … |
| /64 | low | other | sourceIssues (missed misprint, §4.4.2 p.80 and §4.4.3 p.83) | There are two composition misprints that no sourceIssue records. pi : X -> S is the universal curve, while y' and y land in J, so the image in S is pi_J o y', … |
| /65 | low | other | sourceIssues (missed error, §4.6.3 p.100); cf. note on … | The paper recalls the relative Bogomolov conjecture of [DGH2, Conj. 1.2] for K 'a global field over k', function fields included. In the function-field case … |
| /66 | low | missing | PAPER-YUAN-26/220 and /229 | The step from Zhang's Lemma 3.7 (stated for a divisor D) to Proposition A.5's form in g_v needs the identity deg(omega_{C/O_K}/F_v) = 2g_v - 2 + val(v), with … |
| /67 | low | other | sourceIssues E29 (review verdict 'confirmed') | E29 is not a demonstrable slip. Property (2) is the vanishing of an integral of a Green function. What p.114 proves is that this holds once //.//'_Delta is … |
| /68 | low | other | sourceIssues (missing entry), Appendix A p.111 | There is an unrecorded slip on p.111. 'Part (2) gives a concrete way to construct admissible metrics of O(∆)', but p.112 builds that metric from Theorem A.3(3) … |
| /69 | low | missing | Appendix A p.105 (no item); used on p.113 | There is no item for the g>1 reformulation of Theorem A.1's properties (1)-(2) in terms of c1(omega,//.//_a). It is the form the existence proof actually … |
| /70 | low | library-claim | PAPER-YUAN-26/195; /191 and /193 (the C×C part) | GZ.2 plans existence and normalization of the archimedean Green kernel. Its description, and AUDIT-25's target list for it, name neither the Arakelov residue … |
| /71 | low | other | PAPER-YUAN-26 routes 9 and 11 (titles); review notes 'all four ids … | Route 11's title, 'Heights, rational points and obstructions, Part II: uniform Bogomolov for curves', differs from the title that six other accepted routes … |
| /72 | low | error | PAPER-YUAN-26/200 and /216 (planned … | Both items are statements over a field: even and odd line bundles with [2]^* through the theorem of the cube, and [2]^*O(θ_α) for a Jacobian. The field-level … |
| /73 | low | error | PAPER-YUAN-26/114 (route 8) and /33 (route 8); route 8 brief imports | /114, integrality of the fibre powers Y^m_{/S} of a flat family with geometrically integral generic fibre, is pure scheme theory. An accepted route already … |
| /74 | low | duplicate | PAPER-YUAN-26/79 (route 9, JacobianChallengePartII) | The canonical identification of the Hodge line of Pic^0 of a stable curve with det π_*ω, over an arbitrary base, is already decomposed as a node of the … |
| /75 | low | other | PAPER-YUAN-26 route briefs 8–11 and report table | The briefs do not meet §16's 'names the roadmaps it imports from, by title and id'. Route 8 gives wrong titles ('Tropical and Berkovich arithmetic' for … |

## Notes for the fix job

- **/1, Lemma 2.1(1).** Record it as a new source issue with the corrected hypothesis O_S ≅ π_*O_X universally (for
  example, smooth fibres). The lemma's only use (p. 39) is for a smooth family, so nothing downstream breaks.
- **/4, the Poincaré bundle.** Record the sign convention of P as a new source issue. Pin P explicitly as
  m^*O(−θ) ⊗ p₁^*O(θ) ⊗ p₂^*O(θ) throughout /53–/65 and /211–/216.
- **/5, M̄_g.** This is the unapplied edit of the confirmed RT-AREA-etale/4: apply Edits 1–3 of `RT-AREA-etale.fixes.md`
  together.
- **Corrections that never reached the items.** Several medium findings (/10, /12, /23, /52) are cases where a
  correction
  the review accepted was not carried into the items, as PROTOCOL §18 requires.
- **Other papers' routes.** The duplicates (/35–/39, /74) need the owner chosen by the other papers' accepted routes;
  this
  extraction's routes should import from it.
