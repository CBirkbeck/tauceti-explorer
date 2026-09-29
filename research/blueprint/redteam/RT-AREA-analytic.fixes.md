# RT-AREA-analytic: fixes

Fixer: Claude Code, session `cc-e94dc5`, 29 September 2026 (issue #3959).
- Findings: `RT-AREA-analytic.result.json`.
- Verdicts: `RT-AREA-analytic.review.json`.
- One finding, confirmed. The review corrects the proposed fix, and the corrected contract is followed here.

The missing theorem needs a new roadmap: a Part II of the Tau Ceti Chebotarev roadmap. Under PROTOCOL.md §17 that is recorded as a **note for the maintainer**. The upstream roadmap is never given new layers directly (§15), and no atlas file is edited here. This report is the only file changed.

## /1 (medium, missing): Chebotarev density for arithmetic schemes has no owner

### What was checked

**AnalyticNumberTheory:AN.4 and RS-07.**
- AN.4 "connect[s] number-field ideal counting, Hecke characters and completed L-functions to the analytic class-number formula and Chebotarev".
- The accepted restructuring RS-07 keeps AN.4 at number-field comparison maps and prime-ideal applications.
- Neither assigns a Frobenius-density theorem for schemes of finite type over ℤ.

**The upstream Chebotarev roadmap** (`tauceti:TauCetiRoadmap/Chebotarev`, "The Chebotarev density theorem").
- Its "In scope" list is number-field throughout: Frobenius prime sets, Dirichlet-density Chebotarev "over an arbitrary number field", `π_C` and natural density.
- Its public interfaces are `frobeniusPrimeSet`, `hasDirichletDensity_frobeniusPrimeSet`, `hasNaturalDensity_frobeniusPrimeSet` and the rest.
- No layer concerns closed points of higher-dimensional schemes.

**The two consumers.**
- **PAPER-ABDURRAHMAN-VENKATESH-25, item /20** ("Chebotarev density for arithmetic schemes", §2.8 p. 18 and §2.14 pp. 25–26) is routed by route 4 to AN.4.
  - The route is accepted. But its review reason concerns the large-sieve and Deligne-weights estimates of §6.4, not the item.
  - That acceptance does not establish AN.4 as the supplier, as the finding's review says.
- **PAPER-SCHMIDT-STIX-16, items /38 and /84** ("Chebotarev detection on regular arithmetic models", proofs of Proposition 5.1 and Lemma 5.2) are routed by route 4 to AN.4.
  - That route is **rejected**; the extraction's verdict is `revise` and its gap G4 is open.
  - The finding's "two accepted extractions" is therefore inaccurate, as the review notes.

**Other owners.** No other stage owns the theorem:
- the only atlas stage relating arithmetic schemes to their (abelian) étale fundamental group is HigherLocalFieldsAndHigherClassFieldTheory:HL.6, a reciprocity comparison, not a density theorem;
- Tau Ceti BelyiMaps Layer 12 explicitly excludes a scheme-theoretic π₁.

**Why the unrestricted statement is wrong.** The red team proposed stating the theorem for every normal integral ring of finite type over ℤ. Spec F_p is such a scheme. Its connected constant cover of degree two, Spec F_{p²}, has group ℤ/2, but Spec F_p has one closed point and so realises only one Frobenius class. A density statement over all such rings is false. The characteristic-zero (flat, dominant over Spec ℤ) case must come first, and positive characteristic is a separate theorem with its own sources.

### Note for the maintainer: a Part II of the Chebotarev roadmap

**Proposed roadmap.**
- **Id:** `ChebotarevPartIIArithmeticSchemes`.
- **Title:** "The Chebotarev density theorem, Part II: arithmetic schemes".
- **Parent:** `tauceti:TauCetiRoadmap/Chebotarev`.
- **Area:** `algebraicnt`.

**Brief for its design job.**

> Prove the Chebotarev density theorem for arithmetic schemes in Serre's form (*Lectures on N_X(p)*,
> §9), first in the characteristic-zero case the consumers use. Let X be a nonempty connected normal
> scheme, flat and of finite type over Spec Z (so dominant over Spec Z), of Krull dimension d; let
> Y → X be a connected finite étale Galois cover with group G, and C ⊆ G a subset stable under
> conjugation. For a closed point x of X (finite residue field of order N(x)) the Frobenius elements
> of the points of Y above x form a conjugacy class Frob_x of G. State and prove that the set of closed
> points x with Frob_x ⊆ C has density |C|/|G|, with the density convention fixed explicitly from the
> source. Serre's is the Dirichlet density relative to the dimension:
> Σ_{x∈S} N(x)^{−s} ~ δ·log(1/(s−d)) as s → d⁺. Prove its relation to the natural-density or
> log-weighted form the consumers use. State the two consumer corollaries as separate theorems:
> - every conjugacy class of G is Frob_x for some closed point x (Schmidt–Stix, for regular connected
>   flat finite-type models);
> - a ℤ/2-cover split at a density-one set of closed points is trivial (Abdurrahman–Venkatesh §2.8).
>
> Recover the relative-dimension-zero case X = Spec O_K[1/N] as the upstream number-field theorem
> (`hasDirichletDensity_frobeniusPrimeSet`), proving the comparison rather than re-proving it.
> Extract Serre's full proof and name the owner of each input it uses, including the point-count
> estimates for the fibres. Carry the quantitative normalization of Abdurrahman–Venkatesh §2.14
> (closed points weighted by log q_x) as an explicit check. Import the number-field Frobenius elements
> and prime-ideal interfaces from NumberFieldArithmetic, the density and Frobenius-prime-set
> interfaces from the upstream Chebotarev roadmap (Layers 1, 2, 10 and 14), the analytic
> Dirichlet-series tools from AnalyticNumberTheory AN.4, and finite étale covers and Galois actions
> from Mathlib and the Tau Ceti ModularCurves 0D layer. Positive characteristic (X of finite type
> over F_p, where a density statement needs the geometric/arithmetic splitting of the cover) is a
> separate, separately sourced theorem, not part of this statement. Do not state the theorem for
> every normal integral ring of finite type over Z: Spec F_p with its degree-two constant cover is a
> counterexample.

**Consequences for the existing records.** These are notes; no file is edited here.

- **PAPER-ABDURRAHMAN-VENKATESH-25 route 4.** Item /20 belongs to the new Part II, not to AN.4. When the Part II is adopted, move the item out of route 4 into a route to it. Route 4's acceptance reason should also be corrected, since it discusses the §6.4 estimates rather than this item.
- **PAPER-SCHMIDT-STIX-16 route 4 (rejected, gap G4).** Items /38 and /84 can be re-routed to the new Part II, whose first corollary is exactly /38. Naming an owner does not by itself accept the rejected route, which goes through the extraction's own revision and review.
- **RS-07.** Keep AN.4 as narrowed. Add a pointer saying that the arithmetic-scheme density theorem lives in `ChebotarevPartIIArithmeticSchemes`, so the two consumer routes stop pointing at a stage that disclaims them.

**Kept.**
- The upstream Chebotarev roadmap's layers, which are not re-planned.
- AN.4's number-field scope and RS-07's narrowing.
- The quantitative normalization check and the full extraction of Serre's proof, which stay explicit obligations of the Part II. Serre's book is not publicly available and was not read here.
