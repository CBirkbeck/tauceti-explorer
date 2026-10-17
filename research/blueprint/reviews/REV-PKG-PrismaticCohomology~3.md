# Independent package review, round 3: PrismaticCohomology (Part I)

**Verdict: accepted, with the fixes below applied in place.** Two ownership
questions are left for the maintainer (§4). They concern other roadmaps' text
and the tier order, not a gap in this package.

Reviewer: Claude (Opus), session `claude-e8DelM`, issue #10233, 2026-10-17.
The package was written by Codex sessions `codex-r34hIf`, `codex-TrnTU4` and
`codex-2fDWWk`, and repaired and split by `codex-68yXMm` (#10214, merged as
#10228). Earlier reviews were by `codex-6c8mLq` and `claude-Pb2mL7`. This
reviewer took part in none of those jobs. The packets were read, not edited.

Scope, as the manager set it: `research/blueprint/packages/PrismaticCohomology`,
Part I (Layers 0–2). PerfectoidQuotients and AInfCohomology may be suppliers.
PadicHodgeTheory and Parts II–IV may appear only as consumers. Size and
duplication problems are to be flagged.

During the review the maintainer opened TauCetiRoadmap draft #1057 (head
`7901cc888`, 19:06Z), which ports this package. §6 lists what the port needs
from this review.

## 1. Size

| | Before | After |
| --- | ---: | ---: |
| README.md | 259,081 B | 259,938 B |
| Suggested.lean | 229 lines | 280 lines |

Both are inside the manager's 170–260 KB band and the 5,000-line limit. The
upstream section names are longer than the atlas labels they replace, which
cost about 7 KB. That was recovered by regrouping the 110-row Mathlib table by
topic. Every name Part I cites is kept. Five names only the later parts use
(`Ideal.map`, `Ideal.Quotient.factor`, `frobenius`, `Units`, `Perfection`)
were dropped. Two duplicated worked values were also removed. No hypothesis,
API item or Check was dropped.

## 2. Order (suppliers and consumers)

- **PadicHodgeTheory**: named only in *Downstream consumers* and in the
  opening chain sentence. No *Needs* line, table row or Dependencies line
  cites it.
- **Parts II–IV**: no *Needs* line cites a section ≥ 3. The remaining mentions
  are statements that a later part does more, and none is used: §1.5 (the
  Breuil–Kisin twists of Part II §3.9 "are not used here"), §1.22 (the general
  de Rham comparison is Part II §3.17), the Conventions twist remark and the
  Layer 1 introduction.
- **PerfectoidQuotients** (#1042) and **AInfCohomology** (#1044) are cited
  only as suppliers. Every name imported from PerfectoidQuotients §0.0 occurs
  in its README at head `a23c611`: `perfectoid_tor_independence`,
  `fontaine_tor_independence`, `delta_etale_extension`,
  `completeEtale_algebraization`, `delta_witt2_etale`,
  `delta_derivedCompletion` and `perfectPrism_completeEtale_lift`.
- No `FoundationsAndLibraryIntegration` or `UPSTREAM:` id appears.

## 3. Supplier contracts (fixed)

The package still cited atlas stage ids (`DD:DD.1`, `CR:CR.0`, `EDS:E5:…`,
`SF:SF.4`, `PS:…`) through an abbreviation paragraph. Those ids name no
section of the upstream READMEs. The upstream de-cycling also moved several of
them: the cotangent complex and derived completion now live in
DerivedModuleAlgebra #944, and PD envelopes and `A_cris` in
DerivedDeRhamCohomology Layer PD. Two stale PerfectoidQuotients ids also
remained: `Q0:integral-algebra/…` (Layer 0 Dependencies) and `Q0:almost`
(§2.31).

The fix adopts the label mapping of the maintainer's port (#1057), which I
derived section by section. I then checked every cited section against the
current upstream heads: DerivedModuleAlgebra #944 `d62d8b6`,
DerivedDeRhamCohomology #868 `08978fa`, CrystallineCohomology #857
`a264b09`, EnhancedDerivedSheaves #908 `ba9de88`, PerfectoidSpaces #818
`4624e66`, PerfectoidQuotients #1042 `a23c611`, AInfCohomology #1044
`052ef9e`, PerfectoidTowers #816 `dd042fb`, and SchemeAndStackFoundations
and AlgebraicVectorBundles on main. A script found all 426 cited section
tokens as headings.

| Atlas label | Now cited as |
| --- | --- |
| DD.0 | DerivedModuleAlgebra §§0.1–0.17 and 0.25 |
| DD.1 | DerivedModuleAlgebra §§1.1–1.9 and DerivedDeRhamCohomology §§1.10–1.23 |
| DD.2 (ordinary complex) | DerivedDeRhamCohomology §§2.7–2.27 and 5.8 (§§2.7–2.21) |
| DD.3 (polynomial Cartier) | DerivedDeRhamCohomology §§3.1–3.6 (§3.4) |
| DD.4 | CrystallineCohomology §§CR.DDR.4.5 and CR.DDR.5.18–CR.DDR.5.22 |
| DD.5 | DerivedDeRhamCohomology §§5.1–5.7 and 5.17; §5.26 for the formal étale realization of §1.0 |
| CR.0 | DerivedDeRhamCohomology §§PD.6–PD.7 |
| CR.1, CR.2 | CrystallineCohomology §§CR.1.1–CR.1.3, §§CR.2.1–CR.2.3 |
| CR.3 (smooth Cartier) | DerivedDeRhamCohomology §§3.4–3.6 |
| EDS E1, E2, E3, E5 | EnhancedDerivedSheaves §§0.1–0.3 and E1.1–E1.4; Layers E2 and E3 (§E3.1); §§E5:abstract.1–2, E5:descent; §§E5:animation.1 and E5:animation.4 |
| SF.1, SF.2, SF.4 | SchemeAndStackFoundations §1.1, §§2.1–2.6, §§4.7–4.8 |
| Q0:almost | PerfectoidSpaces §§P0.1–P0.14 |
| Q0:integral-algebra/… | DerivedDeRhamCohomology §§5.1–5.4; PerfectoidQuotients §§0.1 and 0.3 |
| IntegralHeckeAndGaloisDeterminants §6.4 (Koszul) | DerivedModuleAlgebra §0.K.1, as AInfCohomology #1044 and DerivedDeRhamCohomology #868 cite it |

Three choices differ from the port: §§2.7–2.27 instead of 2.7–2.26, because
§2.27 holds the continuous forms of completely smooth algebras; §5.26 added
for §1.0; and P0.1–P0.14 instead of P0.1–P0.11, because §2.31 also needs
almost unramified maps. Prose mentions were rewritten to name the precise
section: DerivedModuleAlgebra §1.7 for complete flatness, §1.8 for bounded
torsion, §§0.14–0.17 for décalage; DerivedDeRhamCohomology §PD.6 for the
universal property of envelopes, §§1.14–1.17 for filtered objects. The
"Compatibility API" lines of the imported interfaces, which invented local
names for supplier objects, became prose descriptions of the supplier
interface, as in the port. API bullets that only renamed PerfectoidSpaces'
predicates (`Prismatic.IsDistinguished`, `Prismatic.Prism.IsBounded`,
`IsPerfect`, `IsOrientable`, `IsCrystalline`) were removed. No other part uses
them.

## 4. Duplication and ownership

**Against current Tau Ceti and TauCetiRoadmap main.** The current Tau Ceti
library (`a91d3aaf`) has no δ-rings, prisms, perfectoidization or arc
topology. Its `IsDistinguished` hits are Weierstrass distinguished
polynomials, and its prism hits are homotopy prism operators. None of the 75
roadmaps on main plans them. Nothing was removed on this account.

**PerfectoidSpaces §P4.15.2 (#818).** It "develops δ-rings, free δ-algebras,
distinguished elements … restricted to the constructions below". Its
Suggested.lean has no δ declaration. Scope now states the boundary: the
δ-structure of §0.3 is the same notion over an arbitrary commutative ring, and
on a ℤ_(p)-algebra it is the PerfectoidSpaces δ-ring. Layer 0 adds only the
API PerfectoidSpaces does not state. P4.15 is unchanged between the head the
fix round read (`3a308c7`) and the current head. The round-2 classification of
§§0.55–2.30 therefore still holds.

**For the maintainer, not fixable here:**

1. **Owner of general perfectoidization.** The Scope section of
   PerfectoidQuotients #1042 (head `a23c611`) still says that general
   perfectoidization of animated rings, arc descent and J-almost purity
   "belong to `PerfectoidQuotientsPartIIIntegralPerfectoidization`" (the pending
   DESIGN-PerfectoidQuotientsPartII). This package owns the same material in
   §§2.0 and 2.22–2.31. One of the two texts must change.
2. **Order.** PerfectoidTowers §P8.18 (#816, a lower tier) states the
   universal integral perfectoid ring under an integral extension
   (`exists_perfectoidization`). Its route cites BS22 Theorem 10.11 and
   Corollary 8.14, and only §2.31 here plans them, with §§2.22–2.30. Either
   P8.18 takes BS22 Theorem 10.11 as an external input, or the general
   perfectoidization moves below PerfectoidTowers, for instance into the
   pending PerfectoidQuotients Part II. Then this part would import it.
   PerfectoidShimuraVarieties records the same need. §2.31 now says that its
   universal ring is the one of §P8.18, and states in one clause what it adds:
   discreteness of the animated perfectoidization, and the J-almost purity
   statements.

The arc topology itself (§2.0) has no other owner. The search covered every
atlas package, packet and the fetched upstream READMEs; DiamondsAndVStacks
cites Bhatt–Mathew only for spectral submersions.
EtaleCohomologyFoundations #938 does not state the Fujiwara–Gabber or
formal-gluing results that §2.0 uses (ARC Theorems 6.4 and 6.11).

## 5. Sources

**Full locator sweep.** A script read all 415 numbered labels cited in
`(BS22|ALB23|BMS2|BL22|Bha12|ARC …)` citations. For each it tested whether
the label's statement header occurs on a cited page of
the arXiv texts: BS22 v4, ALB23 v4, BMS2 v2, BL22 v1, Bha12 v1 and ARC v4, in
all of which printed page = PDF page. Statement locators were sound. The
residual flags are ALB23's "(published: …)" alternative numbers and
references without a page. The proof routes, written in the compaction round,
had 17 wrong locators, all now fixed:

| Section | Was | Now |
| --- | --- | --- |
| §0.60 route | BS22 Remarks 2.37, 2.45 (no Remark 2.45) | Remark 2.37 and Corollary 2.44, pp.24, 27 |
| §0.92 route | BS22 Lemma 2.14 (none) | Remark 2.14, p.16 |
| §1.7 route | BS22 Construction 4.5 (none), pp.37–38 | Constructions 4.17–4.18, pp.41–42 |
| §1.8 route | BS22 Construction 4.5 and Remark 4.6 | Construction 4.18 and its footnote, p.42 |
| §1.10 route | BS22 Corollary 4.12, pp.42–43 | Lemmas 4.20 and 4.22, pp.43–44 |
| §1.11 route | BS22 Lemma 4.8, p.39 (initiality of A_inf, p.38) | Lemma 4.21 and its proof, p.43 |
| §1.18 route | Lemma 4.10 and Theorem 6.3, pp.40, 53–54 | Lemma 4.10, p.39; Proposition 6.2 with proof, p.51 |
| §1.20 route | Theorem 4.11, pp.40–42 | Theorem 4.11, p.40; Theorem 6.3 with proof, pp.52–53 |
| §1.21 route | Corollary 4.12, pp.42–43 (no proof there) | Corollary 4.12, p.40, and Theorem 6.3, p.52 |
| §1.22 route | Theorem 6.3 | Theorem 6.4 and its proof, pp.53–54 |
| §1.23 route | BS22 Corollary 4.13 (none) | Theorem 1.8, final sentence, p.4; Corollary 4.12, p.40 |
| §2.13 route | Lemma 7.7 only | Lemma 7.7 and Example 7.9, pp.57–59 |
| §1.0 | BMS2 "Lemmas 4.28–4.30, pp.21–25, Remark 10.4" (4.29 is a remark) | Definitions 4.10 and 4.20, Lemmas 4.28 and 4.30, pp.20–25; Remark 10.4, p.75 |
| §2.0 | ARC "Proposition 2.1 and Lemma 2.2" (Lemma 2.2 does not exist) | Proposition 2.1 and Lemma 2.3, p.9 |
| §2.0 | ARC "Example 2.8, p.10" (the rank-two valuation cover) | Proposition 2.8 and Corollary 2.9, p.10 |
| §2.0 | ARC "Proposition 6.4" (formal glueing) | Theorem 6.4, pp.48–49 |
| §2.31 | BS22 "Propositions 10.2–10.4" (10.3 is a lemma) | Proposition 10.2, Lemma 10.3, Proposition 10.4 |

**Source corrections claimed by the package, read on the page:**

- BS22 Lemma 3.7(2)–(3), p.30, as printed lacks derived completeness of M and
  B. M = A[1/p] satisfies the printed hypothesis and is not classically
  complete. Confirmed (§0.81).
- BS22 Construction 6.1, p.51, assumes "the Frobenius on A/p is flat", while
  Example 3.4, p.29, proves only d-complete flatness, which is what is used.
  Confirmed (§1.17).
- BS22 Theorem 1.8(5), p.4, has no qcqs hypothesis. Confirmed (§1.21).
- BS22 Remark 2.37, p.24, prints D_(x)(Z_(p)). Confirmed (§0.68).
- In the proof of BS22 Lemma 8.6, p.66, the reduction A/(p, φ⁻¹(d)) is
  semiperfect. Confirmed (§2.26).

## 6. Adversarial mathematics pass

| Statement | Instances computed | Result | Change |
| --- | --- | --- | --- |
| Lean `addCorrection`, `integerDelta` | C₂=−xy; C₃(1,2)=−6; δ₂(2)=−1, δ₂(4)=−6, δ₃(2)=−2 | True | None |
| `delta_prime`, `no_delta_structure`, `idealClosure_prime` | δ(p)=1−p^(p−1); in characteristic p, δ(p)=δ(0) forces 0=1; p and δ(p) in the closure give 1 | True | None |
| `distinguished_prime_mem` | p·δ(x)=φ(x)−x^p; no primality needed | True | None |
| `reconstruction` | Z⊕F₂ε has characteristic zero and 2-torsion, so CharZero does not suffice | True | None |
| §0.10, §0.14 square-zero family | derivative of C_p; additivity and product law of δ_λ checked coordinatewise; δ_λ(1+ε)=(λ−1)ε | True | None |
| §0.20 Witt units | inverse (c,d) with c=a⁻¹, d=−c^p b/(a^p+pb); (1,1) at p=2 has ghost 3 | True | None |
| §§0.22–0.27 localization | criterion via the Witt section; δ(1/3)=1/9 at p=2; δ(1/X)=−1/(X^p(X^p+p)); (3,1)²=(9,0)=(3,0)² in Z⊕F₂ε | True | None |
| §0.30 sharpness | δ(p^(n+1))=p^n(1−p^((n+1)(p−1))); constant term of δ(X^m) is p^(m−1) | True | None |
| §0.48 minimality Check | the old Check (I=0, J=(2)) satisfies both sides of the equivalence, so it tests nothing | **Vacuous** | Replaced by I=J=(2): I⊂J but I_δ=Z⊄J; Lean example likewise |
| §§0.55, 0.56 free and Witt δ-rings | δ(x₀²)=2x₀²x₁+2x₁² at p=2; δ_W(V[1])=δ(2)=−1 in Z₂ has zeroth coordinate 1; w_Z(2)≠[2] | True | None |
| §0.58 W₂ pullback | (p,0) is the image of (p,−p^(p−1)); (1,0) is not in the image; W₂(F_p)=Z/p² | True | None |
| §0.64 p-torsion | Z_p[x]/(x^p−1) is reduced with φ(x−1)=0; Z_p[x]/(x²), φ(x)=px, is injective and not reduced; the argument without Z_(p): p^pδ(x)=p^(p−1)(φ(x)−x^p)=0, so δ(p)φ(x)=0 and φ(x)=0 | True | None |
| §§0.66, 0.67 | δ(y^(p^n))∈p^nA by induction on the integral identity; δ(d)≡[a₁]^p mod p | True | None |
| §§0.68, 0.69, 0.86, 0.88 | δ(x²/2)=x⁴/8+x²δ(x)+δ(x)², x⁴/8=3γ₄(x); Warning 2.41 values; δ(x/2)=x²/8; z₁=x^p/p^(p+1) | True | None |
| §0.91, §0.92 | δ(4)=−6, δ²(4)=−21; gcd argument for p^n=0; δ₂(2)=−4 from φ²(2)=2 | True | None |
| §1.17 | the mod-p factorization of α; can(d)∉pB when A/(p,d)≠0, since A/(p,d^p) ⊂ B/p is free | True | None |
| §1.21 | infinite disjoint union of Spf F_p: (∏Z_p)⊗̂Z_p⟨x⟩→∏Z_p⟨x⟩ is not surjective | True | None |
| §1.26 (3)–(4) | mod-p de Rham of Z_p⟨X⟩: H⁰=F_p[X^p], H¹=F_p[X^p]X^(p−1)dX, consistent with Hodge–Tate through Cartier; an elliptic curve with j∉F_p is not isomorphic to its Frobenius twist | True | None |
| §2.0 arc Checks | V_q⊔V/q is an arc cover and not a v-cover (Spec W is connected); Z_p→Q_p and Z_p→F_p are not arc_p covers | True | Locators fixed |
| §2.14(4) | εu^[n]↦(n+1)u^[n+1] is injective; u^[p] is a nonzero class killed by p; reduction kernel contains u^[p−1]; H⁻¹(A/I⊗ᴸA/I)=I/I² | True | None |

## 7. Form

Removed: "authored … acceptance calculation", "PIN-square" and
"PIN-adic-complete" (with their reference entries), eleven
"full statement and proof, printed", "This promotes the existing … API", "the
separate lemma target supplies", six "supplied by ⟨title⟩" (now §-numbers),
"Local prerequisite", "Prerequisite API", "Local API", "These are local
prerequisites, not inputs from a later roadmap", "without using a later
integral-perfectoidization roadmap", ten lower-case template stubs, and
lower-case headings §§1.26, 2.18, 2.21 and §0.72. *How to read the build*
now describes the three layers instead of repeating the Summary. Unused
references FF and CS were removed. A markdown-it rendering showed 39
spurious emphasis spans from `*` and `_` in formulas. All of them were present
before this review. 31 lines were escaped reversibly; the visible text was
checked unchanged, and 0 spurious spans remain. No verbatim source passage
or section-by-section summary was found.

## 8. Suggested.lean

The base is the port's file, which adds API names to the docstrings and a
closing comment listing the README-only interfaces. The vacuous minimality
example is corrected (§6). Ten signatures were spot-checked against the
README: `addCorrection` (§0.1), `Structure` (§0.3), `FrobeniusLift` (§0.4),
`associatedFrobenius` (§0.5), `integerDelta` (§0.8), `IsDeltaMap`, `IsStable`
(§0.9), `idealClosure` (§0.48), `IsDistinguished` (§0.61) and `IsRankOne`
(§0.66). Their hypotheses match; nothing is vacuous and there is no `True`
placeholder. Data definitions have real bodies (`check_sorry_data.py` exit 0).

## 9. For the port (#1057)

The README here is the port's mapping, applied to the package text at the
atlas pins, plus the corrections of §§3, 5, 6 and 7. To bring #1057 in line:

- Apply the 17 locator fixes of §5 and the §0.48 Check and example fix.
- Remove the process residue of §7. The port still has "PIN-square",
  "printed", "supplied by", "Local prerequisite" and the template stubs.
- Add the Scope boundaries with PerfectoidSpaces §P4.15.2 and PerfectoidTowers
  §P8.18, and the §2.31 sentence.
- Repair the port's automatic code spans where they split a formula. In
  §0.22, `` `i(s)^p`*i(phi(s))*`delta_B(z)=…` `` renders an italic; §0.85
  splits `` `O_C⟨x^{1/p^∞}`, `y^{1/p^∞}⟩` ``; and §0.75 splits the ξ sum at
  "+ …".

## Checks run

- `lean-check` on the final Suggested.lean at the pinned build (Mathlib
  `082e2d3`): exit 0, 22 `declaration uses sorry` warnings, nothing else.
- `python3 research/blueprint/intake.py check-files` on README.md,
  Suggested.lean and metadata.toml: 3 files, 0 problems.
  `scripts/check_sorry_data.py`: exit 0.
- All 110 Mathlib names (105 after regrouping) checked against the pinned declaration index;
  `WittVector.fontaineTheta_teichmuller` (from the port) also exists at the
  pin. All 388 internal links and the four cross-part links resolve.
- metadata.toml (`topic = "math.AG"`) unchanged.
- No language server, Lake build or cache fetch was started, and nothing was
  run in the read-only checkouts. Upstream heads were read through the GitHub
  API.
